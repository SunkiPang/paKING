import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
  return <String, dynamic>{
    'version.securityPatch': build.version.securityPatch,
    'version.sdkInt': build.version.sdkInt,
    'version.release': build.version.release,
    'version.previewSdkInt': build.version.previewSdkInt,
    'version.incremental': build.version.incremental,
    'version.codename': build.version.codename,
    'version.baseOS': build.version.baseOS,
    'board': build.board,
    'bootloader': build.bootloader,
    'brand': build.brand,
    'device': build.device,
    'display': build.display,
    'fingerprint': build.fingerprint,
    'hardware': build.hardware,
    'host': build.host,
    'id': build.id,
    'manufacturer': build.manufacturer,
    'model': build.model,
    'product': build.product,
    'supported32BitAbis': build.supported32BitAbis,
    'supported64BitAbis': build.supported64BitAbis,
    'supportedAbis': build.supportedAbis,
    'tags': build.tags,
    'type': build.type,
    'isPhysicalDevice': build.isPhysicalDevice,
    'androidId': build.androidId,
    'systemFeatures': build.systemFeatures,
  };
}

Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
  return <String, dynamic>{
    'name': data.name,
    'systemName': data.systemName,
    'systemVersion': data.systemVersion,
    'model': data.model,
    'localizedModel': data.localizedModel,
    'identifierForVendor': data.identifierForVendor,
    'isPhysicalDevice': data.isPhysicalDevice,
    'utsname.sysname:': data.utsname.sysname,
    'utsname.nodename:': data.utsname.nodename,
    'utsname.release:': data.utsname.release,
    'utsname.version:': data.utsname.version,
    'utsname.machine:': data.utsname.machine,
  };
}

class _MyPageState extends State<MyPage> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  bool isModify = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController carNumController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    nameController.text = "김한동";
    carNumController.text = '1';
    phoneNumController.text = 'xxxx-xxxx-xxxx';
    initPlatformState();

    super.initState();
  }

  Future<void> initPlatformState() async {
    Map<String, dynamic> deviceData = <String, dynamic>{};

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;

    setState(() {
      _deviceData = deviceData;
    });
  }

  //여기까지는 기기정보 받는거



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "마이페이지",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isModify ? isModify = false : isModify = true;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: isModify
                        ? Row(
                            children: [
                              Icon(
                                Icons.check,
                                color: Color(0xff6200EE),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "저장",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff6200EE),
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        : Row(
                            children: [
                              Icon(
                                Icons.mode_edit,
                                color: Color(0xff6200EE),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "수정",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff6200EE),
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            isModify
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '성함',
                          ),
                          controller: nameController,
                          onChanged: (text) {
                            setState(() {
                              nameController.text = text;
                            });
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '차량번호 끝자리',
                          ),
                          controller: carNumController,
                          onChanged: (text) {
                            setState(() {
                              carNumController.text = text;
                            });
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          children: [
                            Icon(Icons.info),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                  "입력해주신 차량번호 끝자리는 차량 부제가 시행되는 주차장을 필터링하기 위해 사용됨을 알려드립니다."),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "성함",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              nameController.text,
                              style: TextStyle(color: Colors.grey),
                            )
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
                              "차량번호 끝자리",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              carNumController.text,
                              style: TextStyle(color: Colors.grey),
                            )
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
                              "기기번호",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              _deviceData.isEmpty
                                  ? "..."
                                  : Platform.isAndroid
                                      ? _deviceData['androidId']
                                      : _deviceData['identifierForVendor'],
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Divider(),
                        Row(
                          children: [
                            Icon(Icons.info),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                  "기기번호는 고객님께서 사용하고 계신 스마트폰 기기의 고유번호이므로 수정이 불가함을 알려드립니다."),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
