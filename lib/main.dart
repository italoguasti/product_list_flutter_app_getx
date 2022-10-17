import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:getx_lesson_one/pages/login_page.dart';
import 'package:getx_lesson_one/pages/pages.dart';
import 'firebase_options.dart';
import 'theme/app_theme.dart';

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
        theme: makeAppTheme(),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => const SplashPage()),
          GetPage(name: '/welcome', page: () => const WelcomePage()),
          GetPage(name: '/login', page: () => const LoginPage()),
          GetPage(name: '/signup', page: () => const SignupPage()),
          GetPage(name: '/home', page: () => const HomePage()),
          GetPage(name: '/editProduct', page: () => const EditProductPage()),
          GetPage(
              name: '/createProduct', page: () => const CreateProductPage()),
        ]);
  }
}
