import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_lesson_one/models/models.dart';
import 'package:http/http.dart' as http;

class Auth extends GetxController {
  static const webApiKey = 'AIzaSyAjKfSSl7th8cegZf7G-9LTGmhIIWKL1Ak';

  static Future<void> _authenticate(
      String email, String password, String urlFragment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlFragment?key=$webApiKey';
    final response = await http.post(
      Uri.parse(url),
      // headers: {'authorization': zxpoaxjaopisjd,},
      body: jsonEncode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );

    final body = jsonDecode(response.body);

    if (body['error'] != null) {
      throw AuthException(key: body['error']['message']);
    } else {
      //_token = body['idToken'];
    }
    print(body);
  }

  static Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  static Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
