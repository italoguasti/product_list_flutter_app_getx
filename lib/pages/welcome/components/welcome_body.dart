// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../theme/theme.dart';
import '../../../components/components.dart';
import '../../pages.dart';

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
              'WELCOME',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: size.height * .04),
            Center(
              child: SvgPicture.asset(
                'assets/icons/welcome.svg',
                width: size.width * .7,
              ),
            ),
            SizedBox(height: size.height * .04),
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
