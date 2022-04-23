import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_project_demo/local/db.dart';
import 'package:getx_project_demo/local/prefs.dart';
import 'package:getx_project_demo/model/user.dart';

class UpdatePasswordScreenController extends GetxController {
  User? prefdata;
  final _streams = <StreamSubscription>[];
  TextEditingController passwordController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void onInit() {
    _streams.add(DB().dao.getCurrentUser(AppPref().email).listen((event) {
      prefdata = event;
      update();
    }));
    // getUserEmail();
    super.onInit();
  }

  updatePasswordButton() {
    DB().dao.updateUser(passwordController.text, prefdata!.email);
    passwordController.clear();
    oldPasswordController.clear();
    confirmPasswordController.clear();
    Get.back();
    update();
  }

// getUserEmail() {
//   // print(AppPref().email);
//   DB().dao.getCurrentUser(AppPref().email);
//       // .then((value) {
//     // prefdata = value!;
//     // update();
//   // });

// }
}
