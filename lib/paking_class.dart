import 'package:flutter/material.dart';

class ParkingLot {
  int id;
  String name;
  String type;
  String addr;
  String contactNum;
  String feeInfo;
  String basicRate;
  String addRate;
  String dayRate;
  String monthRate;
  String weekHours;
  String satHours;
  String holiHours;
  String noDriving;

  ParkingLot(this.id,
      this.name,
      this.type,
      this.addr,
      this.contactNum,
      this.feeInfo,
      this.basicRate,
      this.addRate,
      this.dayRate,
      this.monthRate,
      this.weekHours,
      this.satHours,
      this.holiHours,
      this.noDriving,);
}


class User {
  int deviceId;
  String displayName;
  int lastDigit;
  List<int> favorites;

  User(this.deviceId,
      this.displayName,
      this.lastDigit,
      this.favorites,);
}