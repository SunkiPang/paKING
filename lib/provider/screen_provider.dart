import 'package:flutter/material.dart';

class ScreenProvider with ChangeNotifier {
  //전체 스크린 컨트롤
  int _selectedIndex = 0;

  int get screenIndex => _selectedIndex;

  //Map 스크린 필터 값 및 페이지 조정
  bool _isMap = true;

  bool get isMap => _isMap;

  void changeScreen(int selected) {
    _selectedIndex = selected;
    notifyListeners();
  }

  void changeMapFilter() {
    _isMap ? _isMap = false : _isMap = true;
    notifyListeners();
  }
}

