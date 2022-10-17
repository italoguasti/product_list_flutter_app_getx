// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../theme/theme.dart';
import '../components.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'LOGIN',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: size.height * .04),
          Center(
            child: SvgPicture.asset(
              'assets/icons/login.svg',
              height: size.height * .35,
            ),
          ),
          SizedBox(height: size.height * .03),
          RoundedInputField(
            hintText: 'Your Email',
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
          ),
          RoundedButton(
            text: 'LOGIN',
            press: () {},
            color: AppColors.primary,
          ),
          AlreadyHaveAnAccountCheck(
            press: () => Get.offAllNamed('/signup'),
          ),
        ],
      ),
    );
  }
}
