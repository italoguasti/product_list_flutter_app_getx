import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Auth extends GetxController {
  static const _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAjKfSSl7th8cegZf7G-9LTGmhIIWKL1Ak';

  static Future<void> signup(String email, String password) async {
    final response = await http.post(
      Uri.parse(_url),
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );
  }
}
