import 'package:flutter/material.dart';

class InputTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;

  const InputTextFormField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.textInputType,
    required this.textInputAction,
    this.onFieldSubmitted,
    this.focusNode,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      autocorrect: false,
      enableSuggestions: false,
    );
  }
}
