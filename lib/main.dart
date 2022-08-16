import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:getx_lesson_one/pages/home_page.dart';
import 'package:getx_lesson_one/pages/splash_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final ThemeData tema = ThemeData();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Products',
        theme: tema.copyWith(
          colorScheme: tema.colorScheme.copyWith(
            primary: const Color(0xFF4a00e0),
            secondary: const Color(0xff4158bbf),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          textTheme: tema.textTheme.copyWith(
            bodyText1: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14.0,
              color: Colors.black,
            ),
          ),
        ),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => const SplashPage()),
          GetPage(name: '/home', page: () => const HomePage()),
        ]);
  }
}
