import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/filter_screen.dart';
import 'package:test_flutter/paking_class.dart';
import 'package:test_flutter/provider/screen_provider.dart';

class ShowGoogleMap extends StatefulWidget {
  Completer<GoogleMapController> _controller = Completer();

  Map<MarkerId, Marker> markers =
      <MarkerId, Marker>{}; // CLASS MEMBER, MAP OF MARKS
  @override
  _ShowGoogleMapState createState() => _ShowGoogleMapState();
}

class _ShowGoogleMapState extends State<ShowGoogleMap> {
  List<bool> _filterValues = [true, true, true, true, true, true];

  ParkingLot parkingSample = ParkingLot(
    2000,
    "영일대 주차장",
    "공영(노외)",
    "경상북도 포항시 북구 두호동 1016-3",
    "054-280-9420",
    "유료",
    "50원 / 5분",
    "50원 / 5분",
    "2000원",
    "50,000원",
    "00:00~24:00",
    "00:00~24:00",
    "00:00~24:00",
    "요일제",
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final Widget filterDialog = StatefulBuilder(builder: (context, setState) {
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
                        height: size.height * 0.005,
                      ),
                      Divider(),
                      SizedBox(
                        height: size.height * 0.005,
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
                        height: size.height * 0.005,
                      ),
                      Divider(),
                      SizedBox(
                        height: size.height * 0.005,
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
                        height: size.height * 0.005,
                      ),
                      Divider(),
                      SizedBox(
                        height: size.height * 0.005,
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
                        height: size.height * 0.005,
                      ),
                      Divider(),
                      SizedBox(
                        height: size.height * 0.005,
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
                        height: size.height * 0.005,
                      ),
                      Divider(),
                      SizedBox(
                        height: size.height * 0.005,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "부제시행주차장",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Switch(
                            value: _filterValues[5],
                            onChanged: (bool value) {
                              setState(() {
                                _filterValues[5] = value;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Container(
                        width: size.width * 0.3,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "확인",
                            style: TextStyle(color: Colors.black),
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

    final Widget detailDialog = StatefulBuilder(builder: (context, setState) {
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
                    Column(
                      children: [
                        Text(
                          parkingSample.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Text(
                          parkingSample.type,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 18),
                        )
                      ],
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),
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
                        height: size.height * 0.005,
                      ),
                      Divider(),
                      SizedBox(
                        height: size.height * 0.005,
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
                        height: size.height * 0.005,
                      ),
                      Divider(),
                      SizedBox(
                        height: size.height * 0.005,
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
                        height: size.height * 0.005,
                      ),
                      Divider(),
                      SizedBox(
                        height: size.height * 0.005,
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
                        height: size.height * 0.005,
                      ),
                      Divider(),
                      SizedBox(
                        height: size.height * 0.005,
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
                        height: size.height * 0.005,
                      ),
                      Divider(),
                      SizedBox(
                        height: size.height * 0.005,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "부제시행주차장",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Switch(
                            value: _filterValues[5],
                            onChanged: (bool value) {
                              setState(() {
                                _filterValues[5] = value;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Container(
                        width: size.width * 0.3,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "확인",
                            style: TextStyle(color: Colors.black),
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

    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          markers: Set<Marker>.of(widget.markers.values),
          // YOUR MARKS IN MAP
          initialCameraPosition: CameraPosition(
            target: LatLng(36.103591549634345, 129.38800959286618),
            zoom: 17,
          ),
          onMapCreated: (GoogleMapController controller) {
            widget._controller.complete(controller);
          },
          myLocationButtonEnabled: true,
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: TextButton(
              onPressed: () {
                showDialog<void>(
                  context: context,
                  builder: (context) => filterDialog,
                );
              },
              child: Icon(
                Icons.filter_alt,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
