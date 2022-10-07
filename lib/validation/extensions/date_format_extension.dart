import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

extension DateFormatExtension on DateTime {
  String toDateFormat() {
    initializeDateFormatting();
    final format = DateFormat(DateFormat.YEAR_NUM_MONTH_DAY, 'pt_Br').format(this);

    return format;
  }
}
