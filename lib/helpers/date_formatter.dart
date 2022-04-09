import 'package:intl/intl.dart';

class DateFormatter {
  final DateFormat formatter = DateFormat('dd MMMM');
   final DateFormat formatterMMMdd = DateFormat('MMMM, dd');
  String formatDate(DateTime date) {
    return formatter.format(date);
  }

  String formatDateMMMdd(DateTime date) {
    return formatterMMMdd.format(date);
  }
}
