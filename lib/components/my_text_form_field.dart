import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const MyTextFormField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.textInputType,
    required this.textInputAction,
    this.onFieldSubmitted,
    this.focusNode,
    this.validator,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
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
