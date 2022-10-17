// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function()? press;
  final Color color;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: size.width * .8,
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(
            horizontal: 80.0,
            vertical: 16.0,
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
