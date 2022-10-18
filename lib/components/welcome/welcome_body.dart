// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../theme/theme.dart';
import '../components.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: WelcomeBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'HEY, WELCOME!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: size.height * .05),
            Center(
              child: SvgPicture.asset(
                'assets/images/use-logo.svg',
                width: size.width * .5,
              ),
            ),
            SizedBox(height: size.height * .2),
            RoundedButton(
              text: 'LOGIN',
              press: () => Get.offAllNamed('/login'),
              color: AppColors.primary,
            ),
            RoundedButton(
              text: 'SIGNUP',
              press: () => Get.offAllNamed('/signup'),
              color: AppColors.lightPurple,
            ),
          ],
        ),
      ),
    );
  }
}
