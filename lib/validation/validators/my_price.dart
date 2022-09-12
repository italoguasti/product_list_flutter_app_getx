import 'package:getx_lesson_one/validation/validation.dart';

class MyPrice implements ValidateInput {
  final String _value;

  MyPrice(this._value);

  @override
  String? validator() {
    if (_value.trim().isEmpty) {
      return 'Enter a valid price.';
    } else if (double.parse(_value.extractNumbers()) <= 0.0) {
      return 'Enter a value above zero.';
    } else {
      final regex = RegExp(r'^(R\$ )?(\d+(\.)?)+(\,\d{1,2})?$');
      final isValid = _value.isNotEmpty || regex.hasMatch(_value);
      return isValid ? null : 'Invalid price.';
    }
  }
}
