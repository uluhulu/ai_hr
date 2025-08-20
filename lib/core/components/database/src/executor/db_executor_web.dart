import 'package:ai_hr/core/utils/logger.dart';
import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';

///Drift uses the FileSystem Access API to store databases if it's available.
///Otherwise, it will fall back to a slower implementation based on IndexedDb
///in a shared worker.
///
QueryExecutor createExecutor() => DatabaseConnection.delayed(
  Future(() async {
    final result = await WasmDatabase.open(
      databaseName: 'db.sqlite',
      sqlite3Uri: Uri.parse("/sqlite3.wasm"),
      driftWorkerUri: Uri.parse('/drift_worker.js'),
    );

    if (result.missingFeatures.isNotEmpty) {
      logger.warning(
        "Missing features: ${result.missingFeatures.join(", ")}"
        "Using ${result.chosenImplementation} implementation.",
      );
    }

    return result.resolvedExecutor;
  }),
);
