import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:getx_lesson_one/pages/home.dart';
import 'package:getx_lesson_one/pages/splash.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Products',
        theme: ThemeData(
          primaryColor: Colors.purple,
        ),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => const SplashPage()),
          GetPage(name: '/home', page: () => const HomePage()),
        ]);
  }
}
