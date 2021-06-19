import 'package:flutter/material.dart';

class ScreenProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get screenIndex => _selectedIndex;

  void changeScreen(int selected) {
    _selectedIndex = selected;
    notifyListeners();
  }
}
