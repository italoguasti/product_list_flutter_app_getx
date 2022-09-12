import 'package:flutter/services.dart';
import 'package:getx_lesson_one/validation/validation.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final double value = double.parse(newValue.text.extractNumbers());

    final formatter = NumberFormat.simpleCurrency(locale: 'pt_Br');

    final String newText = formatter.format(value / 100);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
