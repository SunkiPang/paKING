import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: TextButton(
              onPressed: () {},
              child: Text("시작하기"),
            ),
          )
        ],
      ),
    );
  }
}
