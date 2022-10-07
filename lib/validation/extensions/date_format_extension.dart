import 'package:intl/intl.dart';

extension DateFormatExtension on DateTime {
  String toDateFormat() => DateFormat('dd/MM/yyyy').format(this);
}
