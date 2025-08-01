import 'package:intl/intl.dart';

String formatTextDate(String dateString) {
  DateTime date = DateTime.parse(dateString);
  return DateFormat('MMMM d, y').format(date);
}
