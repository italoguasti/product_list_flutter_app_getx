import 'package:get/get.dart';

import '../data/data.dart';

class SplashController extends GetxController {
  Future<void> tryAutoLogin() async {
    final token = await SecureStorage.readToken();

    if (token != null) {
      Future.delayed(const Duration(seconds: 4), () {
        Get.offAllNamed('/home');
      });
    } else {
      Get.offAllNamed('/welcome');
    }
  }
}
