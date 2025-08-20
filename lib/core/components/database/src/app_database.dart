import 'package:ai_hr/core/components/database/src/executor/db_executor_stub.dart';
import 'package:ai_hr/core/components/database/src/tables/request_logs_table.dart';
import 'package:ai_hr/core/utils/logger.dart';
import 'package:drift/drift.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [RequestLogsTable])
class AppDatabase extends _$AppDatabase{
  AppDatabase([QueryExecutor? executor]) : super(executor ?? createExecutor());
  
  @override
  int get schemaVersion => 1;

   /// Удаляем все данные из БД
  Future<void> deleteEverything() => transaction(
        () async {
          for (final table in allTables) {
            if (table.actualTableName != 'systemEnumTable') {
              logger.info('[Database] || clear ${table.actualTableName}');
              await delete(table).go();
            }
          }
          logger.info('[Database] || all tables cleared!');
        },
      );

       /// Логгируем запрос в БД
  Future<int> logRequest(RequestLogsTableCompanion requestLogsTableCompanion) =>
      into(requestLogsTable).insert(requestLogsTableCompanion);





}
