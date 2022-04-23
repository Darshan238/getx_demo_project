import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project_demo/local/db.dart';
import 'package:getx_project_demo/local/prefs.dart';
import 'package:getx_project_demo/model/user.dart';

class LoginScreenController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  loginButton(BuildContext context) async {
    User? _user = await DB().dao.getAllUser(emailController.text, passwordController.text);
    // print(a!.email);

    if (_user != null) {
      AppPref().email = emailController.text;
      Get.toNamed('/homeScreen');
      emailController.clear();
      passwordController.clear();
    } else {
      Get.defaultDialog(
        onConfirm: () {
          Get.back();
        },
        title: "Alert Dialog",
        middleText: "i am Alert Dialog",
        backgroundColor: Colors.black,
        titleStyle: const TextStyle(color: Colors.white),
        middleTextStyle: const TextStyle(color: Colors.white),
      );
    }
  }

  singUpButton(BuildContext context) {
    Get.toNamed("/singUpScreen");
  }
}
