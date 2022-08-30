import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier{
  late bool isLoggedIn;
  LoginProvider({required this.isLoggedIn});

  void setLoginStatus(bool status) {
    isLoggedIn = status;
    notifyListeners();
  }
}