import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getx_lesson_one/models/models.dart';

class Auth extends GetxController {
  Dio dio = Dio();
  FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();

  String? logoutEmail;
  String? logoutToken;

  static const webApiKey = 'AIzaSyAjKfSSl7th8cegZf7G-9LTGmhIIWKL1Ak';

  Future<void> _authenticate(
      String email, String password, String urlFragment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlFragment?key=$webApiKey';

    final data = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };

    final response = await dio.post(
      url,
      data: data,
    );

    final body = response.data;

    if (body['error'] != null) {
      throw AuthException(key: body['error']['message']);
    } else {
      logoutEmail = body['email'];
      logoutToken = body['idToken'];
      final token = body['idToken'];
      await flutterSecureStorage.write(key: 'token', value: token);
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }

  //Logout
  void logout() {
    // logoutEmail = null;
    // logoutToken = null;
    // refresh();

    // Get.offAllNamed('/login');
  }
}
