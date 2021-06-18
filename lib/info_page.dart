import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "주차장 안내",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Text(
              "노상주차장",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "도로에 설치된 주차장",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Divider(),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              "노외주차장(공영)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "시, 구 소유 주차장",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Divider(),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              "노외주차장(민영)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "개인소유 주차장",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Divider(),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              "부설주차장",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "건물 주차장으로 건물 이용자 위주 개방",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Divider(),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              "2부제",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "차 번호 끝자리가 홀수인 차량은 홀수 일에만, \n짝수인 차량은 짝수 일에만 주차 가능",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Divider(),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              "5부제 또는 요일제",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "차 번호 끝자리가 월요일은 1, 6인 차량,\n화요일은 2, 7번인 차량, 수요일은 3, 8번인 차량,\n목요일은 4, 9번인 차량, 금요일은 5 또는 0번인 차량은 주차 불가",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Divider(),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              "10부제",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "차 번호 끝자리와 날짜의 끝자리 숫자가 같은 날에는 주차 불가",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Divider(),
            SizedBox(
              height: size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
