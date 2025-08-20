import 'dart:async';

import 'package:ai_hr/core/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

abstract interface class ExceptionTrackingManager {
  Future<void> enableReporting();
  Future<void> disableReporting();
}

abstract base class ExceptionTrackingManagerBase
    implements ExceptionTrackingManager {
  ExceptionTrackingManagerBase(this._logger);

  final Logger _logger;

  StreamSubscription<LogMessage>? _subscription;

  Stream<LogMessage> get _reportLogs => _logger.logs.where(_isWarningOnError);

  static bool _isWarningOnError(LogMessage log) =>
      log.level.compareTo(LoggerLevel.warning) >= 0;

  @mustCallSuper
  @mustBeOverridden
  @override
  Future<void> disableReporting() async {
    await _subscription?.cancel();
    _subscription = null;
  }

  @mustCallSuper
  @mustBeOverridden
  @override
  Future<void> enableReporting() async {
    _subscription ??= _reportLogs.listen((log) async {
      if (_shouldReport(log.error)) {
        await _report(log);
      }
    });
  }

  @pragma('vm:prefer-inline')
  bool _shouldReport(Object? error) => true;

  Future<void> _report(LogMessage log);
}

final class SentryTrackingManager extends ExceptionTrackingManagerBase {
  SentryTrackingManager(
    super.logger, {
    required this.sentryDns,
    required this.environment,
  });

  final String sentryDns;

  final String environment;

  @override
  Future<void> enableReporting() async {
    await SentryFlutter.init((options) {
      // options.dsn = 'https://a03009c8cc897ec1307eb81a37cc74e9@o4509609030582272.ingest.de.sentry.io/4509609031041104';
      options.dsn = sentryDns;
      options.tracesSampleRate = 1.0;
      options.debug = kDebugMode;
      options.environment = environment;
    });
    await super.enableReporting();
    // Initialize Sentry or any other error reporting service here.
  }

  @override
  Future<void> disableReporting() async {
    await Sentry.close();
    await super.disableReporting();
    // Clean up Sentry or any other error reporting service here.
  }

  @override
  Future<void> _report(LogMessage log) async {
    final error = log.error;
    final stackTrace = log.stackTrace;
    if (error == null && stackTrace == null) {
      await Sentry.captureMessage(log.message.toString());
      return;
    }
    await Sentry.captureException(error ?? log.message, stackTrace: stackTrace);
  }
}
