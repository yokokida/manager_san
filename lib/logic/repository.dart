
import 'package:firebase_auth/firebase_auth.dart';
import 'manager.dart';



class UserRepository {
  final DatabaseManager dbManager;
  UserRepository({this.dbManager});

  static User currentUser;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();



  Future<void> isSignIn() async {
    final firebaseUser = await _auth.currentUser();
    if (firebaseUser != null) {
      currentUser = await dbManager.getUserInfoFromDbById(firebaseUser.uid);
      return true;
    }
    return false;
  }



  Future<bool> signIn() async {
    try {
      // ログインリクエスト + 認証情報取得
      GoogleSignInAccount signInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication signInAuthentication =
      await signInAccount.authentication();

      // 信用状の取得
      final auth.AuthCredential credential = auth.GoogleAuthProvier.credential(
        isToken: signInAuthentication.idToken,
        accessToken: signInAuthentication.accessToken,
      );

      // Firebase認証の実行
      final firebaseUser = (await _auth.signInWithCredential(credential)).user;
      if(firebaseUser == null) {
        return false;
      }

      // DBにuserがいるかどうかチェック
      final isUserExistedInDb = await dbManager.searchUserInDb(firebaseUser);
      if (!isUserExistedInDb) {
        await dbManager.insertUser(_convertToUser(firebaseUser));
      }


      currentUser = await dbManager.getUserInfoFromDbById(firebaseUser.uid);
      return true;
      // ユーザーidを取ってくる
      await dbManager.getUserInfoFromDbById(String uid) async {
        final query = await _db
            .collection('user')
            .where('userId', isEquelTo: userId)
            .get();
        return User.fromMap(query.documents[0].data);
      };
    } catch(error) {
      print('sign in error caught!');
      return false;
    }
  }

  _convertToUser(auth.User firebaseUser) {
    return User(
      userId: firebaseUser.uid,
      displayName: firebaseUser.displayName,
      inAppUserName: firebaseUser.displayName,
      photoUrl: firebaseUser.photoUrl,
      email: firebaseUser.email,
      bio: '',
    );
  }
}




