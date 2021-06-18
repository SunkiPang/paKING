import 'package:flutter/material.dart';
import 'package:test_flutter/show_google_map.dart';
import 'package:test_flutter/start_page.dart';
import 'filter_page.dart';
import 'info_page.dart';
import 'map_drawer.dart';
import 'mypage.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  String userName = "김한동";

  List _widgetOptions = [
    ShowGoogleMap(),
    FilterPage(),
    InfoPage(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ParKING"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex,
        //현재 선택된 Index
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text('홈'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
              title: Text('즐겨찾기'), icon: Icon(Icons.favorite)),
          BottomNavigationBarItem(
            title: Text('안내'),
            icon: Icon(Icons.info),
          ),
          BottomNavigationBarItem(
            title: Text('마이페이지'),
            icon: Icon(Icons.person),
          ),
        ],
      ),
      drawer: MapDrawer(userName: userName),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
