import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/provider/screen_provider.dart';


final Widget filterDialog = StatefulBuilder(builder: (context, setState) {
  List<bool> _filterValues = [true, true, true, true, true, true];
  Size size = MediaQuery.of(context).size;
  final screen = Provider.of<ScreenProvider>(context);

  return Dialog(
    insetPadding: EdgeInsets.all(20),
    child: SingleChildScrollView(
      child: Container(
        width: size.width,
        padding:
        const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "검색필터",
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "공영주차장",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Switch(
                        value: screen.getFilterValues(0),
                        onChanged: (bool value) {
                            screen.changeFilterValues(0,value);
                        },
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "민영주차장",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Switch(
                        value: screen.getFilterValues(1),
                        onChanged: (bool value) {
                          screen.changeFilterValues(1,value);
                        },
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "노상주차장",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Switch(
                        value: screen.getFilterValues(2),
                        onChanged: (bool value) {
                          screen.changeFilterValues(2,value);
                        },
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "노외주차장",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Switch(
                        value: screen.getFilterValues(3),
                        onChanged: (bool value) {
                          screen.changeFilterValues(3,value);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.001,
                  ),
                  Divider(),
                  SizedBox(
                    height: size.height * 0.001,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "부설주차장",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Switch(
                        value: screen.getFilterValues(4),
                        onChanged: (bool value) {
                          screen.changeFilterValues(4,value);
                        },
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "무료주차장",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Switch(
                        value: screen.getFilterValues(5),
                        onChanged: (bool value) {
                          screen.changeFilterValues(5,value);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Container(
                    width: size.width * 0.2,
                    decoration: BoxDecoration(
                      color: Color(0xff6200EE),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "확인",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
});