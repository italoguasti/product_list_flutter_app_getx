import 'package:flutter/material.dart';

class InputTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  // final Function(String?)? onSaved;

  const InputTextFormField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.textInputType,
    required this.textInputAction,
    // required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      // onSaved: onSaved,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      autocorrect: false,
      enableSuggestions: false,
    );
  }
}
