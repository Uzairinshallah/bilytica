import 'package:intl/intl.dart';

extension DateFormatExtension on String {
  String toFormattedDateTime() {
    DateTime dateTime = DateTime.parse(this);

    String formattedDate = DateFormat('EEE, MMM d y').format(dateTime);

    String formattedTime = DateFormat('hh.mm a').format(dateTime);

    return '$formattedDate\n$formattedTime';
  }
}
