// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../theme/theme.dart';
import 'components.dart';

class RoundedPasswordField extends StatelessWidget {
  final String? hinText;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    this.hinText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        obscureText: true,
        decoration: InputDecoration(
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
