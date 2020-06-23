library utils;

import 'package:intl/intl.dart';

String formatDate(date) {
  return DateFormat.yMMMMd('en_US').format(date);
}

String formatTime(date) {
  return DateFormat.jm().format(date);
}
