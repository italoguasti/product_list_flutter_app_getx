import 'package:getx_lesson_one/validators/validate_input.dart';

class MyRating implements ValidateInput {
  final String _value;

  MyRating(this._value);

  @override
  String? validator() {
    if (_value.trim().isEmpty) {
      return 'Rating is obrigatory.';
    }
    if (double.parse(_value) < 1 || double.parse(_value) > 5) {
      return 'Enter a rating between 1 and 5.';
    }
    return null;
  }
}