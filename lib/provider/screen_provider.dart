import 'package:flutter/material.dart';

class ScreenProvider with ChangeNotifier {
  //전체 스크린 컨트롤
  int _selectedIndex = 0;

  int get screenIndex => _selectedIndex;
  List<bool> _filterValues = [true, true, true, true, true, true];

  //Map 스크린 필터 값 및 페이지 조정
  bool _isMap = true;

  bool get isMap => _isMap;


  //디테일 다이어로그

  bool _detailFavorite = false;
  bool _detailButtonTab = false;

  bool get detailFavorite => _detailFavorite;
  bool get detailButtonTab => _detailButtonTab;

  void changeFavorite() {
    _detailFavorite?
    _detailFavorite = false:
    _detailFavorite = true;
    notifyListeners();
  }
  void changeButtonTab() {
    _detailButtonTab?
    _detailButtonTab = false:
    _detailButtonTab = true;
    notifyListeners();
  }


// 필터 다이어로그
  bool getFilterValues(int index){
    return _filterValues[index];
  }

  void changeFilterValues(int index, bool value){
    _filterValues[index] = value;
    notifyListeners();
  }

  void changeScreen(int selected) {
    _selectedIndex = selected;
    notifyListeners();
  }

  void changeMapFilter() {
    _isMap ? _isMap = false : _isMap = true;
    notifyListeners();
  }
}

