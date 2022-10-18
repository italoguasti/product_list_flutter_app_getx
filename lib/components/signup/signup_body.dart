import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_lesson_one/validation/validation.dart';

import '../../theme/theme.dart';
import '../components.dart';

class SignUpBody extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  SignUpBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SignupBackground(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
              controller: _emailController,
              textInputAction: TextInputAction.next,
              validator: (v) => MyEmail(v!).validator(),
            ),
            RoundedPasswordField(
              hinText: 'Password',
              controller: _passwordController,
              textInputAction: TextInputAction.next,
              validator: (v) => MyPassword(v!).validator(),
            ),
            RoundedPasswordField(
              hinText: 'Confirm password',
              controller: _confirmPasswordController,
              textInputAction: TextInputAction.done,
              validator: (v) =>
                  MyConfirmPassword(v!, _passwordController.text).validator(),
            ),
            RoundedButton(
              text: 'SIGNUP',
              press: () {
                _formKey.currentState!.validate();
              },
              color: AppColors.primary,
            ),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () => Get.offAllNamed('/login'),
            ),
          ],
        ),
      ),
    );
  }
}
