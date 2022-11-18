// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
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

  final Auth _auth = Auth();
  // final DioExceptions _dioExceptions = DioExceptions();

  bool _isLoading = false;
  bool _obscureText = true;

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      await _auth.login(
        _emailController.text,
        _passwordController.text,
      );

      Get.offAllNamed('/home');
    } on DioError catch (e) {
      Get.snackbar(
        'Error',
        e.error.toString(),
        backgroundColor: AppColors.lightPurple.withOpacity(0.5),
      );
    }

    setState(() => _isLoading = false);
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
                    obscureText: _obscureText,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() => _obscureText = !_obscureText);
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.mediumPurple,
                      ),
                    ),
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
