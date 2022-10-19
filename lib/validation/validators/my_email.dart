import 'package:getx_lesson_one/validation/validators/validate_input.dart';

class MyEmail implements ValidateInput {
  final String value;

  MyEmail(this.value);

  @override
  String? validator() {
    if (value.trim().isEmpty || !value.contains('@')) {
      return 'Please provide a valid email address.';
    }
    return null;
  }
}
