import 'package:getx_lesson_one/validators/validate_input.dart';

class MyType implements ValidateInput{
  final String _value;

  MyType(this._value);

  @override
  String? validator() {
    if (_value.trim().isEmpty) {
      return 'Type is obrigatory.';
    }
    if (_value.trim().length <= 3) {
      return 'The Type needs at least 3 letters.';
    }
    return null;
  }
}