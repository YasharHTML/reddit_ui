import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  late bool isDark;
  ThemeProvider({required this.isDark});
  
  void changeTheme(bool value) {
    isDark = value;
    notifyListeners();
  }
}