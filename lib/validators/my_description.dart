import 'package:getx_lesson_one/validators/validate_input.dart';

class MyDescription implements ValidateInput {
  final String _value;

  MyDescription(this._value);

  @override
  String? validator() {
    if (_value.trim().isEmpty) {
      return 'Description is obrigatory.';
    }
    if (_value.trim().length <= 3) {
      return 'The Description needs at least 4 letters.';
    }
    return null;
  }
}