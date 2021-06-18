import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<bool> _values = [true, true, true, true, true, true];


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
              "검색 필터",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "공영(노상)주차장",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: _values[0],
                  onChanged: (bool value) {
                    setState(() {
                      _values[0] = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Divider(),
            SizedBox(
              height: size.height * 0.01,
            ),            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "공영(노외)주차장",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: _values[1],
                  onChanged: (bool value) {
                    setState(() {
                      _values[1] = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Divider(),
            SizedBox(
              height: size.height * 0.01,
            ),            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "민영(노상)주차장",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: _values[2],
                  onChanged: (bool value) {
                    setState(() {
                      _values[2] = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Divider(),
            SizedBox(
              height: size.height * 0.01,
            ),            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "부설주차장",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: _values[3],
                  onChanged: (bool value) {
                    setState(() {
                      _values[3] = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Divider(),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "무료주차장",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: _values[4],
                  onChanged: (bool value) {
                    setState(() {
                      _values[4] = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Divider(),
            SizedBox(
              height: size.height * 0.01,
            ),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "부제시행주차장",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                // Switch(
                //   value: _values[5],
                //   onChanged: (bool value) {
                //     setState(() {
                //       _values[5] = value;
                //     });
                //   },
                // ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
