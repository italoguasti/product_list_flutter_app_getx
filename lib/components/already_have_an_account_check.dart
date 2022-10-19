import 'package:flutter/material.dart';

import '../theme/theme.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function()? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? 'Don\'t have an Account ? ' : 'Already have an Account ? ',
          style: TextStyle(
            color: AppColors.lightPurple,
            fontSize: 14.0,
            fontFamily: 'Roboto',
          ),
        ),
        SizedBox(height: size.height * .08),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? 'Sign Up' : 'Sign In',
            style: TextStyle(
              color: AppColors.lightPurple,
              fontWeight: FontWeight.w900,
              fontSize: 14.0,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ],
    );
  }
}
