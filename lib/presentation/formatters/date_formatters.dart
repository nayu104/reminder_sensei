import 'package:intl/intl.dart';

String formatYmdE(DateTime? date) {
  if (date == null) {
    return '未設定';
  }
  return DateFormat('yyyy/MM/dd HH:mm').format(date.toLocal());
}
