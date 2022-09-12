import 'package:getx_lesson_one/validation/validators/validate_input.dart';

class MyTitle implements ValidateInput {
  final String _value;

  MyTitle(this._value);

  @override
  String? validator() {
    if (_value.trim().isEmpty) {
      return 'Title is obrigatory.';
    }
    if (_value.trim().length <= 3) {
      return 'The title needs at least 3 letters.';
    }
    return null;
  }
}