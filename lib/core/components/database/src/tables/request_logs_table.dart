import 'package:drift/drift.dart';

class RequestLogsTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get sendHeaders => text()();
  TextColumn get sendBody => text()();

  TextColumn get responseHeaders => text()();
  TextColumn get responseBody => text()();
  IntColumn get responseCode => integer()();

  DateTimeColumn get date => dateTime()();
}
