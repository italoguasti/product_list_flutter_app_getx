import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      Get.offAllNamed('/home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.network(
          'https://usemobile.com.br/wp-content/uploads/2020/07/logo-horizontal-site-branco.svg',
          width: 120.0,
          color: Theme.of(context).colorScheme.primary,
          
          // color: Colors.black,
        ),
      ),
    );
  }
}
