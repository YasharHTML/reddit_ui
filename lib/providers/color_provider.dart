import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  late int colorIndex;
  ColorProvider({required this.colorIndex});

  void changeColorIndex(int value) {
    colorIndex = value;
    notifyListeners();
  }
}
