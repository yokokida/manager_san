import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseManager {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // ユーザーIDを探す
  Future<bool> searchUserInDb(FirebaseUser firebaseUser) async {
    final query = await _db
        .collection('user')
        .where('userId', isEqualTo: firebaseUser.uid)
        .getDocuments();
    if (query.documents.length > 0) {
      return true;
    }
    return false;
  }

  // ユーザーをDBに登録
  Future<void> insertUser(User user) async {
    await _db.collection('user').doc(user.userId).set(user.toMap());
  }

  // ユーザーをDBから取り出す
  Future<User> getUserInFromDbById() async {
    final query =
    await _db.collection('user').where('userId', isEquelTo: userId).get();
    return User.fromMap(query.documents[0].data);
  }

  // データの有無を判定
  Future<List<Post>> getPostMineAndFollowinfs(String userId) async {
    final query = await _db.collection('posts').getDocuments();
    if (query.documents.length == 0) return List();

    var userIds = await getFollwingUserIds(userId);
    userIds.add(userId);

    var results = await getFollwingUserIds(userId);
    userIds.add(userId);
  }

  Future<List<Post>> getFollowingUserIds(String userId) async {
    final query = await _db
        .collection("users")
        .document(userId)
        .collection('follwings')
        .get();
    if (query.documents.length == 0) return List();

    var userIds = List<String>();
  }
}

// Location
class LocationManager {
  Future<Location> getCurrentLocation() async {
    final position =
    await getCurrentPosition(desireAccuracy: LocationAccuracy.low);
    final placeMarks = await geoCoding.placemarkFromCoordinates(
        position.latitude, position.longitude);
    final placeMark = placeMarks.first;
    return Future.value(
        convert(placeMark, position.latitude, position.longitude));
  }

  Future<Location> updateLocation(double latitude, double longitude) async {
    final placeMarks = await geoCoding.placemarkFromCoordinates(
        position.latitude, position.longitude);
    final placeMark = placeMarks.first;
    return Future.value(
        convert(placeMark, position.latitude, position.longitude));
  }

  Location convert(
      geoCoding.Placemark placeMark, double latitude, double longitude) {
    return Location(
      latitude: latitude,
      longtitude: longitude,
      country: placeMark.country,
      state: placeMark.administrativeArea,
      city: placeMark.locality,
    );
  }
}
