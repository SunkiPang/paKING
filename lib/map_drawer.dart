import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/provider/screen_provider.dart';

class MapDrawer extends StatelessWidget {
  const MapDrawer({
    Key? key,
    required this.userName,
  }) : super(key: key);

  final String userName;

  @override
  Widget build(BuildContext context) {
    final screen = Provider.of<ScreenProvider>(context);
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    Text(
                      userName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Text(
                      '님, 안전 운전하세요~',
                      style: TextStyle(fontSize: 22),
                    ),
                  ],
                )),
          ),
          ListTile(
            title: Text('홈'),
            leading: Icon(Icons.home),
            onTap: () {
              screen.changeScreen(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('즐겨찾기'),
            leading: Icon(Icons.favorite),
            onTap: () {
              screen.changeScreen(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('안내'),
            leading: Icon(Icons.info),
            onTap: () {
              screen.changeScreen(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('마이페이지'),
            leading: Icon(Icons.person),
            onTap: () {
              screen.changeScreen(3);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
