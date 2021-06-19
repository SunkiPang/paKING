import 'package:flutter/material.dart';
import 'package:test_flutter/provider/screen_provider.dart';
import 'package:test_flutter/splash_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScreenProvider()),
      ],
      child: MyApp(),
    ));

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


