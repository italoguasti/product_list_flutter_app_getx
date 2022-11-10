// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SavedToken {
  FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();

  String? _token;

  Future<String> get token async {
    if (_token == null) {
      final savedToken = await flutterSecureStorage.read(key: 'token');
      _token = savedToken;
    }
    return _token!;
  }
}