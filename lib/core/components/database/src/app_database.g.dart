// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $RequestLogsTableTable extends RequestLogsTable
    with TableInfo<$RequestLogsTableTable, RequestLogsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RequestLogsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _sendHeadersMeta = const VerificationMeta(
    'sendHeaders',
  );
  @override
  late final GeneratedColumn<String> sendHeaders = GeneratedColumn<String>(
    'send_headers',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sendBodyMeta = const VerificationMeta(
    'sendBody',
  );
  @override
  late final GeneratedColumn<String> sendBody = GeneratedColumn<String>(
    'send_body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _responseHeadersMeta = const VerificationMeta(
    'responseHeaders',
  );
  @override
  late final GeneratedColumn<String> responseHeaders = GeneratedColumn<String>(
    'response_headers',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _responseBodyMeta = const VerificationMeta(
    'responseBody',
  );
  @override
  late final GeneratedColumn<String> responseBody = GeneratedColumn<String>(
    'response_body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _responseCodeMeta = const VerificationMeta(
    'responseCode',
  );
  @override
  late final GeneratedColumn<int> responseCode = GeneratedColumn<int>(
    'response_code',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sendHeaders,
    sendBody,
    responseHeaders,
    responseBody,
    responseCode,
    date,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'request_logs_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<RequestLogsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('send_headers')) {
      context.handle(
        _sendHeadersMeta,
        sendHeaders.isAcceptableOrUnknown(
          data['send_headers']!,
          _sendHeadersMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sendHeadersMeta);
    }
    if (data.containsKey('send_body')) {
      context.handle(
        _sendBodyMeta,
        sendBody.isAcceptableOrUnknown(data['send_body']!, _sendBodyMeta),
      );
    } else if (isInserting) {
      context.missing(_sendBodyMeta);
    }
    if (data.containsKey('response_headers')) {
      context.handle(
        _responseHeadersMeta,
        responseHeaders.isAcceptableOrUnknown(
          data['response_headers']!,
          _responseHeadersMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_responseHeadersMeta);
    }
    if (data.containsKey('response_body')) {
      context.handle(
        _responseBodyMeta,
        responseBody.isAcceptableOrUnknown(
          data['response_body']!,
          _responseBodyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_responseBodyMeta);
    }
    if (data.containsKey('response_code')) {
      context.handle(
        _responseCodeMeta,
        responseCode.isAcceptableOrUnknown(
          data['response_code']!,
          _responseCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_responseCodeMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RequestLogsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RequestLogsTableData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      sendHeaders:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}send_headers'],
          )!,
      sendBody:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}send_body'],
          )!,
      responseHeaders:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}response_headers'],
          )!,
      responseBody:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}response_body'],
          )!,
      responseCode:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}response_code'],
          )!,
      date:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date'],
          )!,
    );
  }

  @override
  $RequestLogsTableTable createAlias(String alias) {
    return $RequestLogsTableTable(attachedDatabase, alias);
  }
}

class RequestLogsTableData extends DataClass
    implements Insertable<RequestLogsTableData> {
  final int id;
  final String sendHeaders;
  final String sendBody;
  final String responseHeaders;
  final String responseBody;
  final int responseCode;
  final DateTime date;
  const RequestLogsTableData({
    required this.id,
    required this.sendHeaders,
    required this.sendBody,
    required this.responseHeaders,
    required this.responseBody,
    required this.responseCode,
    required this.date,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['send_headers'] = Variable<String>(sendHeaders);
    map['send_body'] = Variable<String>(sendBody);
    map['response_headers'] = Variable<String>(responseHeaders);
    map['response_body'] = Variable<String>(responseBody);
    map['response_code'] = Variable<int>(responseCode);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  RequestLogsTableCompanion toCompanion(bool nullToAbsent) {
    return RequestLogsTableCompanion(
      id: Value(id),
      sendHeaders: Value(sendHeaders),
      sendBody: Value(sendBody),
      responseHeaders: Value(responseHeaders),
      responseBody: Value(responseBody),
      responseCode: Value(responseCode),
      date: Value(date),
    );
  }

  factory RequestLogsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RequestLogsTableData(
      id: serializer.fromJson<int>(json['id']),
      sendHeaders: serializer.fromJson<String>(json['sendHeaders']),
      sendBody: serializer.fromJson<String>(json['sendBody']),
      responseHeaders: serializer.fromJson<String>(json['responseHeaders']),
      responseBody: serializer.fromJson<String>(json['responseBody']),
      responseCode: serializer.fromJson<int>(json['responseCode']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sendHeaders': serializer.toJson<String>(sendHeaders),
      'sendBody': serializer.toJson<String>(sendBody),
      'responseHeaders': serializer.toJson<String>(responseHeaders),
      'responseBody': serializer.toJson<String>(responseBody),
      'responseCode': serializer.toJson<int>(responseCode),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  RequestLogsTableData copyWith({
    int? id,
    String? sendHeaders,
    String? sendBody,
    String? responseHeaders,
    String? responseBody,
    int? responseCode,
    DateTime? date,
  }) => RequestLogsTableData(
    id: id ?? this.id,
    sendHeaders: sendHeaders ?? this.sendHeaders,
    sendBody: sendBody ?? this.sendBody,
    responseHeaders: responseHeaders ?? this.responseHeaders,
    responseBody: responseBody ?? this.responseBody,
    responseCode: responseCode ?? this.responseCode,
    date: date ?? this.date,
  );
  RequestLogsTableData copyWithCompanion(RequestLogsTableCompanion data) {
    return RequestLogsTableData(
      id: data.id.present ? data.id.value : this.id,
      sendHeaders:
          data.sendHeaders.present ? data.sendHeaders.value : this.sendHeaders,
      sendBody: data.sendBody.present ? data.sendBody.value : this.sendBody,
      responseHeaders:
          data.responseHeaders.present
              ? data.responseHeaders.value
              : this.responseHeaders,
      responseBody:
          data.responseBody.present
              ? data.responseBody.value
              : this.responseBody,
      responseCode:
          data.responseCode.present
              ? data.responseCode.value
              : this.responseCode,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RequestLogsTableData(')
          ..write('id: $id, ')
          ..write('sendHeaders: $sendHeaders, ')
          ..write('sendBody: $sendBody, ')
          ..write('responseHeaders: $responseHeaders, ')
          ..write('responseBody: $responseBody, ')
          ..write('responseCode: $responseCode, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sendHeaders,
    sendBody,
    responseHeaders,
    responseBody,
    responseCode,
    date,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RequestLogsTableData &&
          other.id == this.id &&
          other.sendHeaders == this.sendHeaders &&
          other.sendBody == this.sendBody &&
          other.responseHeaders == this.responseHeaders &&
          other.responseBody == this.responseBody &&
          other.responseCode == this.responseCode &&
          other.date == this.date);
}

class RequestLogsTableCompanion extends UpdateCompanion<RequestLogsTableData> {
  final Value<int> id;
  final Value<String> sendHeaders;
  final Value<String> sendBody;
  final Value<String> responseHeaders;
  final Value<String> responseBody;
  final Value<int> responseCode;
  final Value<DateTime> date;
  const RequestLogsTableCompanion({
    this.id = const Value.absent(),
    this.sendHeaders = const Value.absent(),
    this.sendBody = const Value.absent(),
    this.responseHeaders = const Value.absent(),
    this.responseBody = const Value.absent(),
    this.responseCode = const Value.absent(),
    this.date = const Value.absent(),
  });
  RequestLogsTableCompanion.insert({
    this.id = const Value.absent(),
    required String sendHeaders,
    required String sendBody,
    required String responseHeaders,
    required String responseBody,
    required int responseCode,
    required DateTime date,
  }) : sendHeaders = Value(sendHeaders),
       sendBody = Value(sendBody),
       responseHeaders = Value(responseHeaders),
       responseBody = Value(responseBody),
       responseCode = Value(responseCode),
       date = Value(date);
  static Insertable<RequestLogsTableData> custom({
    Expression<int>? id,
    Expression<String>? sendHeaders,
    Expression<String>? sendBody,
    Expression<String>? responseHeaders,
    Expression<String>? responseBody,
    Expression<int>? responseCode,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sendHeaders != null) 'send_headers': sendHeaders,
      if (sendBody != null) 'send_body': sendBody,
      if (responseHeaders != null) 'response_headers': responseHeaders,
      if (responseBody != null) 'response_body': responseBody,
      if (responseCode != null) 'response_code': responseCode,
      if (date != null) 'date': date,
    });
  }

  RequestLogsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? sendHeaders,
    Value<String>? sendBody,
    Value<String>? responseHeaders,
    Value<String>? responseBody,
    Value<int>? responseCode,
    Value<DateTime>? date,
  }) {
    return RequestLogsTableCompanion(
      id: id ?? this.id,
      sendHeaders: sendHeaders ?? this.sendHeaders,
      sendBody: sendBody ?? this.sendBody,
      responseHeaders: responseHeaders ?? this.responseHeaders,
      responseBody: responseBody ?? this.responseBody,
      responseCode: responseCode ?? this.responseCode,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sendHeaders.present) {
      map['send_headers'] = Variable<String>(sendHeaders.value);
    }
    if (sendBody.present) {
      map['send_body'] = Variable<String>(sendBody.value);
    }
    if (responseHeaders.present) {
      map['response_headers'] = Variable<String>(responseHeaders.value);
    }
    if (responseBody.present) {
      map['response_body'] = Variable<String>(responseBody.value);
    }
    if (responseCode.present) {
      map['response_code'] = Variable<int>(responseCode.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RequestLogsTableCompanion(')
          ..write('id: $id, ')
          ..write('sendHeaders: $sendHeaders, ')
          ..write('sendBody: $sendBody, ')
          ..write('responseHeaders: $responseHeaders, ')
          ..write('responseBody: $responseBody, ')
          ..write('responseCode: $responseCode, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RequestLogsTableTable requestLogsTable = $RequestLogsTableTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [requestLogsTable];
}

typedef $$RequestLogsTableTableCreateCompanionBuilder =
    RequestLogsTableCompanion Function({
      Value<int> id,
      required String sendHeaders,
      required String sendBody,
      required String responseHeaders,
      required String responseBody,
      required int responseCode,
      required DateTime date,
    });
typedef $$RequestLogsTableTableUpdateCompanionBuilder =
    RequestLogsTableCompanion Function({
      Value<int> id,
      Value<String> sendHeaders,
      Value<String> sendBody,
      Value<String> responseHeaders,
      Value<String> responseBody,
      Value<int> responseCode,
      Value<DateTime> date,
    });

class $$RequestLogsTableTableFilterComposer
    extends Composer<_$AppDatabase, $RequestLogsTableTable> {
  $$RequestLogsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sendHeaders => $composableBuilder(
    column: $table.sendHeaders,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sendBody => $composableBuilder(
    column: $table.sendBody,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get responseHeaders => $composableBuilder(
    column: $table.responseHeaders,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get responseBody => $composableBuilder(
    column: $table.responseBody,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get responseCode => $composableBuilder(
    column: $table.responseCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RequestLogsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RequestLogsTableTable> {
  $$RequestLogsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sendHeaders => $composableBuilder(
    column: $table.sendHeaders,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sendBody => $composableBuilder(
    column: $table.sendBody,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get responseHeaders => $composableBuilder(
    column: $table.responseHeaders,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get responseBody => $composableBuilder(
    column: $table.responseBody,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get responseCode => $composableBuilder(
    column: $table.responseCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RequestLogsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RequestLogsTableTable> {
  $$RequestLogsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sendHeaders => $composableBuilder(
    column: $table.sendHeaders,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sendBody =>
      $composableBuilder(column: $table.sendBody, builder: (column) => column);

  GeneratedColumn<String> get responseHeaders => $composableBuilder(
    column: $table.responseHeaders,
    builder: (column) => column,
  );

  GeneratedColumn<String> get responseBody => $composableBuilder(
    column: $table.responseBody,
    builder: (column) => column,
  );

  GeneratedColumn<int> get responseCode => $composableBuilder(
    column: $table.responseCode,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);
}

class $$RequestLogsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RequestLogsTableTable,
          RequestLogsTableData,
          $$RequestLogsTableTableFilterComposer,
          $$RequestLogsTableTableOrderingComposer,
          $$RequestLogsTableTableAnnotationComposer,
          $$RequestLogsTableTableCreateCompanionBuilder,
          $$RequestLogsTableTableUpdateCompanionBuilder,
          (
            RequestLogsTableData,
            BaseReferences<
              _$AppDatabase,
              $RequestLogsTableTable,
              RequestLogsTableData
            >,
          ),
          RequestLogsTableData,
          PrefetchHooks Function()
        > {
  $$RequestLogsTableTableTableManager(
    _$AppDatabase db,
    $RequestLogsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$RequestLogsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$RequestLogsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$RequestLogsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> sendHeaders = const Value.absent(),
                Value<String> sendBody = const Value.absent(),
                Value<String> responseHeaders = const Value.absent(),
                Value<String> responseBody = const Value.absent(),
                Value<int> responseCode = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
              }) => RequestLogsTableCompanion(
                id: id,
                sendHeaders: sendHeaders,
                sendBody: sendBody,
                responseHeaders: responseHeaders,
                responseBody: responseBody,
                responseCode: responseCode,
                date: date,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String sendHeaders,
                required String sendBody,
                required String responseHeaders,
                required String responseBody,
                required int responseCode,
                required DateTime date,
              }) => RequestLogsTableCompanion.insert(
                id: id,
                sendHeaders: sendHeaders,
                sendBody: sendBody,
                responseHeaders: responseHeaders,
                responseBody: responseBody,
                responseCode: responseCode,
                date: date,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RequestLogsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RequestLogsTableTable,
      RequestLogsTableData,
      $$RequestLogsTableTableFilterComposer,
      $$RequestLogsTableTableOrderingComposer,
      $$RequestLogsTableTableAnnotationComposer,
      $$RequestLogsTableTableCreateCompanionBuilder,
      $$RequestLogsTableTableUpdateCompanionBuilder,
      (
        RequestLogsTableData,
        BaseReferences<
          _$AppDatabase,
          $RequestLogsTableTable,
          RequestLogsTableData
        >,
      ),
      RequestLogsTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RequestLogsTableTableTableManager get requestLogsTable =>
      $$RequestLogsTableTableTableManager(_db, _db.requestLogsTable);
}
