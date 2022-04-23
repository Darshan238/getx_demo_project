import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project_demo/local/db.dart';
import 'package:getx_project_demo/local/prefs.dart';
import 'package:getx_project_demo/model/user.dart';

class SignUpController extends GetxController {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  singUpButton() {
    var _user = User(
        firstName: firstnameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
        // confirmPassword: confirmPasswordController.text
    );

    DB().dao.insertUser(_user);
    AppPref().email = emailController.text;
    firstnameController.clear();
    lastNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    Get.offAllNamed("/homeScreen");
  }

  singInButton() {
    Get.offAllNamed("/loginScreen");
  }
}
