import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_project_demo/local/db.dart';
import 'package:getx_project_demo/local/prefs.dart';
import 'package:getx_project_demo/model/user.dart';

class UpdateProfileScreenController extends GetxController {
  final _streams = <StreamSubscription>[];
  late User updateProfile;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNAmeController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void onInit() async {
    // getUserEmail();
    _streams.add(DB().dao.getCurrentUser(AppPref().email).listen((event) {
      updateProfile = event!;
      update();
      currentController();
    }));
  }

  updateProfileButton() {
    DB()
        .dao
        .profileUpdate(firstNameController.text, lastNAmeController.text, emailController.text, updateProfile.email);
    if (firstNameController.text == updateProfile.firstName &&
        lastNAmeController.text == updateProfile.lastName &&
        emailController.text == updateProfile.email) {
      Get.defaultDialog(
        onConfirm: () {
          Get.back();
        },
        title: "Alert Dialog",
        middleText: "i am current usre",
        backgroundColor: Colors.black,
        titleStyle: const TextStyle(color: Colors.white),
        middleTextStyle: const TextStyle(color: Colors.white),
      );
    } else {
      Get.offAllNamed("/homeScreen");
      AppPref().email = emailController.text;
      update();
    }
  }

  currentController() {
    firstNameController.text = updateProfile.firstName;
    lastNAmeController.value = TextEditingValue(text: updateProfile.lastName);
    emailController.text = updateProfile.email;
  }
}
