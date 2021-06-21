import 'package:flutter/material.dart';
import 'package:test_flutter/paking_class.dart';

final Widget detailDialog = StatefulBuilder(
  builder: (context, setState) {
    Size size = MediaQuery.of(context).size;
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
    bool favorite = false;
    bool buttonTab = false;

    return Dialog(
      insetPadding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height * 0.7,
          // const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              parkingSample.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                            Text(
                              parkingSample.type,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18),
                            )
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              favorite ? favorite = false : favorite = true;
                            });
                          },
                          icon:
                          favorite?
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ):Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.location_on),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              parkingSample.addr,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.phone),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              parkingSample.contactNum,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: buttonTab
                                ? Colors.white
                                : Colors.purpleAccent,
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                buttonTab = false;
                              });
                            },
                            child: Text(
                              "\$ 주차요금",
                              style: TextStyle(
                                color:
                                buttonTab ? Colors.black : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: buttonTab
                                ? Colors.purpleAccent
                                : Colors.white,
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                buttonTab = true;
                              });
                            },
                            child: Text(
                              "\$ 이용시간",
                              style: TextStyle(
                                color:
                                buttonTab ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: buttonTab
                    ? Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "평일",
                          style:
                          TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          parkingSample.weekHours,
                          style: TextStyle(
                              fontWeight: FontWeight.normal),
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
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "토요일",
                          style:
                          TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          parkingSample.satHours,
                          style: TextStyle(
                              fontWeight: FontWeight.normal),
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
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "공휴일",
                          style:
                          TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          parkingSample.holiHours,
                          style: TextStyle(
                              fontWeight: FontWeight.normal),
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
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "차량부제시행",
                          style:
                          TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          parkingSample.noDriving,
                          style: TextStyle(
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xffEDEDED)),
                      child: Row(
                        children: [
                          Icon(Icons.info),
                          SizedBox(
                            width: 4,
                          ),
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text("5부제 또는 요일제"),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                " 차 번호 끝자리가 월요일은 1, 6인 차량,\n 화요일은 2, 7번인 차량, 수요일은 3, 8번인 차량,\n 목요일은 4, 9번인 차량, 금요일은 5 또는 0번인 차량은주차 불가",
                                style: TextStyle(fontSize: 9),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
                    : Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "요금정보",
                          style:
                          TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          parkingSample.feeInfo,
                          style: TextStyle(
                              fontWeight: FontWeight.normal),
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
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "기본주차요금",
                          style:
                          TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          parkingSample.basicRate,
                          style: TextStyle(
                              fontWeight: FontWeight.normal),
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
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "추가요금",
                          style:
                          TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          parkingSample.addRate,
                          style: TextStyle(
                              fontWeight: FontWeight.normal),
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
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "1일주차권요금",
                          style:
                          TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          parkingSample.dayRate,
                          style: TextStyle(
                              fontWeight: FontWeight.normal),
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
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "월정기권요금",
                          style:
                          TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          parkingSample.monthRate,
                          style: TextStyle(
                              fontWeight: FontWeight.normal),
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
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  },
);