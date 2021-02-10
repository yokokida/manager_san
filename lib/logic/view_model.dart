import 'package:flutter/cupertino.dart';
import 'package:manager_san/logic/repository.dart';

class LoginViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  LoginViewModel({this.userRepository});

  bool isLoading = false;
  bool isSuccessful = false;

  // メソッド
  Future<bool> isSignIn() async {
    return await userRepository.isSignIn();
  }
  // メソッド
  Future<void> isSignIn() async {
    isLoading = true;
    norifyListeners();

    isSucceddful = await userRepository.signIn();

    isLoading = false;
    notifyListeners();
  }
}
