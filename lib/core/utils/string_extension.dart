import 'package:intl/intl.dart';

extension StringExtension on String {
  String limit(int lenght) => lenght < length ? substring(0, lenght) : this;
}
