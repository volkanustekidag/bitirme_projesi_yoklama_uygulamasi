import 'package:flutter/material.dart';

class ThemeDataModal extends ChangeNotifier {
  ThemeData _themeData;

  ThemeData get getThemeData => _themeData;

  void setThemeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
}
