import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'local/db.dart';
import 'local/prefs.dart';
import 'modules/home_page/detail_page/detail_screen.dart';
import 'modules/home_page/drawer/update_password_page/update_password_screen.dart';
import 'modules/home_page/drawer/update_profile_page/update_profile_screen.dart';
import 'modules/home_page/home_screen.dart';
import 'modules/intro_page/intro_screen.dart';
import 'modules/login_page/login_screen.dart';
import 'modules/singup_page/signup_screen.dart';
import 'modules/splash_page/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AppPref();
    // DB().dao;
    DB();
    // DB().dao = DB().builder();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.zoom,
      getPages: [
        GetPage(name: '/homeScreen', page: () => HomeScreen()),
        GetPage(name: '/singUpScreen', page: () => SignUpScreen()),
        GetPage(name: '/loginScreen', page: () => LoginScreen()),
        GetPage(name: '/introScreen', page: () => const IntroScreen()),
        GetPage(name: '/updateProfileScreen', page: () => UpdateProfileScreen()),
        GetPage(name: '/updatePasswordScreen', page: () => UpdatePasswordScreen()),
        GetPage(name: '/detailScreen', page: () => DetailScreen()),
        ],
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
