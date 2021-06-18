import 'package:flutter/material.dart';
import 'package:test_flutter/splash_screen.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: SplashScreen(),
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
    );
  }
}
