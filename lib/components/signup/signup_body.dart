import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../theme/theme.dart';
import '../components.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SignupBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'SIGNUP',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: size.height * .02),
          SvgPicture.asset(
            'assets/icons/signup.svg',
            height: size.height * .35,
          ),
          SizedBox(height: size.height * .03),
          RoundedInputField(
            hintText: 'Your Email',
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
            hinText: 'Password',
          ),
          RoundedPasswordField(
            onChanged: (value) {},
            hinText: 'Confirm password',
          ),
          RoundedButton(
            text: 'SIGNUP',
            press: () {},
            color: AppColors.primary,
          ),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () => Get.offAllNamed('/login'),
          ),
        ],
      ),
    );
  }
}
