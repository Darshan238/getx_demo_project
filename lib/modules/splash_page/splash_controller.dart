import 'package:get/get.dart';
import 'package:getx_project_demo/local/prefs.dart';

class SplashScreenController extends GetxController {

  @override
  void onReady() {
    checkLogin();
    super.onReady();
  }

  Future checkLogin() async {
    Future.delayed(
      const Duration(milliseconds:  1000),
      () {
        if (AppPref().seen) {
          if (AppPref().email.isEmpty) {
            Get.offNamed("/loginScreen");
          } else {
            Get.offNamed("/homeScreen");
          }
        } else {
          Get.offNamed('/introScreen');
        }
      },
    );
  }
}
