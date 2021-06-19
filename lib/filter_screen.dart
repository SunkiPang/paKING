import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/provider/screen_provider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<bool> _filterValues = [true, true, true, true, true, true];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final screen = Provider.of<ScreenProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    screen.changeMapFilter();
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "검색 필터",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
              ],
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
                  value: _filterValues[0],
                  onChanged: (bool value) {
                    setState(() {
                      _filterValues[0] = value;
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
                  "공영(노외)주차장",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: _filterValues[1],
                  onChanged: (bool value) {
                    setState(() {
                      _filterValues[1] = value;
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
                  "민영(노상)주차장",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: _filterValues[2],
                  onChanged: (bool value) {
                    setState(() {
                      _filterValues[2] = value;
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
                  "부설주차장",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: _filterValues[3],
                  onChanged: (bool value) {
                    setState(() {
                      _filterValues[3] = value;
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
                  value: _filterValues[4],
                  onChanged: (bool value) {
                    setState(() {
                      _filterValues[4] = value;
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
