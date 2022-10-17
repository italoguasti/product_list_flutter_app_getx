import 'package:flutter/material.dart';

import '../theme/theme.dart';
import 'components.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
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
