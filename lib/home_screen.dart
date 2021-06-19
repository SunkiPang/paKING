import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/provider/screen_provider.dart';
import 'package:test_flutter/show_google_map.dart';
import 'favorite_screen.dart';
import 'filter_screen.dart';
import 'info_screen.dart';
import 'map_drawer.dart';
import 'mypage.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String userName = "김한동";

  List _widgetOptions = [
    ShowGoogleMap(),
    FavoriteScreen(),
    InfoScreen(),
    MyPage(),
    FilterScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final screen = Provider.of<ScreenProvider>(context);
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
        currentIndex: screen.screenIndex,
        //현재 선택된 Index
        onTap: (int index) {
          setState(() {
            screen.changeScreen(index);
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
      body: _widgetOptions.elementAt(screen.screenIndex),
    );
  }
}
