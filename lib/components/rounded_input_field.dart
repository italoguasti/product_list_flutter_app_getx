// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../theme/theme.dart';
import 'components.dart';

class RoundedInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;

  const RoundedInputField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.validator,
    required this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: validator,
        textInputAction: textInputAction,
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(
            Icons.person,
            color: AppColors.mediumPurple,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
