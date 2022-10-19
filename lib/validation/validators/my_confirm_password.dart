// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:getx_lesson_one/validation/validators/validate_input.dart';

class MyConfirmPassword implements ValidateInput {
  final String value;
  final String confirmValue;

  MyConfirmPassword(
    this.value,
    this.confirmValue,
  );

  @override
  String? validator() {
    if (value != confirmValue || value.trim().isEmpty) {
      return 'Entered passwords do not match.';
    }
    return null;
  }
}
