import 'package:get/get.dart';

import '../data/data.dart';

class SplashController extends GetxController {
  final token = SecureStorage.readToken();

  // Está funcionando o login automático, porém preciso alterar a verificação != null, pois está dando errado e mesmo não autenticado o usuário vai para a tela /home.
  void tryAutoLogin() {
    if (token != null) {
      Future.delayed(const Duration(seconds: 4), () {
        Get.offAllNamed('/home');
      });
    } else {
      Get.offAllNamed('/welcome');
    }
  }
}
