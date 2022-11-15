// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//Using Flutter Scure Storage

class SecureStorage {
  static Future<String?> readToken() async {
    FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();

    String? token;

    if (token == null) {
      final savedToken = await flutterSecureStorage.read(key: 'token');
      token = savedToken;
    }
    return token;
  }

  static Future<void> writeAll(String key, Map<String, String> value) async {
    FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();
    await flutterSecureStorage.write(key: key, value: value.toString());
  }

  static Future<Map> readAll(String key) async {
    FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();
    Map<String, dynamic> allValues = await flutterSecureStorage.readAll();
    return allValues;
  }

  static Future<void> writeToken(String key, String value) async {
    FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();
    await flutterSecureStorage.write(key: 'token', value: value);
  }

  static Future<void> deleteToken(String key) async {
    FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();
    await flutterSecureStorage.delete(key: key);
  }
}

// Como o SINGLETON estava anteriormente:
// O motivo de alteração foi o encapsulamento dos métodos do Secure Storage

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class SecureStorage {
  
//   FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();

  // String? _token;

  // Future<String> get token async {
  //   if (_token == null) {
  //     final savedToken = await flutterSecureStorage.read(key: 'token');
  //     _token = savedToken;
  //   }
  //   return _token!;
  // }
// }