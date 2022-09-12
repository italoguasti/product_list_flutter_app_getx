import 'package:getx_lesson_one/validators/validate_input.dart';

class MyPrice implements ValidateInput {
  final String _value;

  MyPrice(this._value);

  @override
  String? validator() {
    if (_value.trim().isEmpty) {
      return 'Enter a valid price.';
    }
    if (double.parse(_value) <= 0) {
      return 'Enter a value above zero.';
    }
    return null;
  }
}