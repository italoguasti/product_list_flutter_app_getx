// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../models/models.dart';
import '../../../theme/theme.dart';
import '../../../validation/validation.dart';
import '../../../components/components.dart';
import '../../pages.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    setState(() => _isLoading = true);

    await Auth.login(
      _emailController.text,
      _passwordController.text,
    );

    setState(() => _isLoading = false);

    Get.offAllNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
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
                    textInputAction: TextInputAction.next,
                    controller: _emailController,
                    validator: (v) => MyEmail(v!).validator(),
                  ),
                  RoundedPasswordField(
                    hinText: 'Password',
                    controller: _passwordController,
                    textInputAction: TextInputAction.done,
                    validator: (v) => MyPassword(v!).validator(),
                  ),
                  RoundedButton(
                    text: 'LOGIN',
                    press: _submit,
                    color: AppColors.primary,
                  ),
                  AlreadyHaveAnAccountCheck(
                    press: () => Get.offAllNamed('/signup'),
                  ),
                ],
              ),
      ),
    );
  }
}
