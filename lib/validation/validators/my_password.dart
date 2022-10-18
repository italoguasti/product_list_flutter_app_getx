import 'package:getx_lesson_one/validation/validators/validate_input.dart';

class MyPassword implements ValidateInput {
  final String value;

  MyPassword(this.value);

  @override
  String? validator() {
    if (value.isEmpty || value.length < 5) {
      return 'Please enter a valid password.';
    }
    return null;
  }
}
