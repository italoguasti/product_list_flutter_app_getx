// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../theme/theme.dart';
import 'components.dart';

class RoundedPasswordField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hinText;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;

  const RoundedPasswordField({
    Key? key,
    required this.controller,
    required this.hinText,
    required this.validator,
    required this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        cursorColor: Colors.white,
        validator: validator,
        textInputAction: textInputAction,
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          errorStyle: const TextStyle(color: Colors.white),
          hintText: hinText,
          icon: Icon(
            Icons.lock,
            color: AppColors.mediumPurple,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: AppColors.mediumPurple,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
