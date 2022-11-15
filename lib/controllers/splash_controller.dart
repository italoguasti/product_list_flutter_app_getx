import 'package:get/get.dart';
import 'package:getx_lesson_one/models/auth.dart';

import '../data/data.dart';

class SplashController extends GetxController {
  Future<void> tryAutoLogin() async {
    final token = await SecureStorage.readToken();
    final expiryDate = Auth().expiryDate;

    if (token != null) {
      Future.delayed(const Duration(seconds: 4), () {
        Get.offAllNamed('/home');
      });
    } else {
      Get.offAllNamed('/welcome');
    }
    print(token);
    print(expiryDate);
  }
}
