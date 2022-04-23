import 'dart:async';
// import 'dart:convert';
// import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project_demo/local/db.dart';
import 'package:getx_project_demo/local/prefs.dart';
import 'package:getx_project_demo/model/home_api.dart';
import 'package:getx_project_demo/model/user.dart';
// import 'package:getx_project_demo/api_g.dart';
//
// import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
  final _streams = <StreamSubscription>[];
  List<ApiModel> userDetail = [];

 // late ApiModel ret;
  User? user;

  @override
  void onInit() {
    DB().dio();
    DB().apiMethod.getUser().then((value) {
      userDetail = value;
      print(userDetail);
      update();
    });
    // init();
    _streams.add(DB().dao.getCurrentUser(AppPref().email).listen((event) {
      user = event;
      update();
    }));
    super.onInit();
  }

  // init() async {
  //   Uri url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
  //   http.Response r1 = await http.get(url);
  //   // print(r1.bodyBytes);
  //   List resdata = jsonDecode(r1.body);
  //   userDetail = resdata.map((e) => ApiModel.fromJson(e)).toList();
  //   debugPrint(userDetail.length.toString());
  //   update();
  // }

  updateProfileButton() {
    Get.toNamed("/updateProfileScreen");
    update();
  }

  updatePasswordButton() {
    Get.toNamed("/updatePasswordScreen");
  }

  logOutButton() {
    Get.toNamed("/loginScreen");
  }

  apiButton() {
    Get.toNamed("/detailScreen");
  }

  alartDialog() {
    Get.defaultDialog(
      onCancel: () {
        Get.back();
      },
      onConfirm: () {
        Get.offAllNamed("/loginScreen");
      },
      title: "Alert Dialog",
      middleText: "i am Alert Dialog",
      backgroundColor: Colors.black,
      titleStyle: const TextStyle(color: Colors.white),
      middleTextStyle: const TextStyle(color: Colors.white),
    );
  }
}
