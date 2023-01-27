import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getx_lesson_one/controllers/controllers.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SplashController splashController = SplashController();

  @override
  void initState() {
    splashController.tryAutoLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'assets/images/splash-logo-guasti.svg',
          width: 500.0,
        ),
      ),
    );
  }
}
