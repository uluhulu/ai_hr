import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart' as logging;

typedef LogFormatter = String Function(LogMessage message, LogOptions options);

final Logger logger = LoggerLogging();

abstract base class Logger {
  Stream<LogMessage> get logs;

  void error(Object message, {Object? error, StackTrace? stacktrace});

  void warning(Object message);

  void info(Object message);

  void debug(Object message);

  void verbose(Object message);

  void logZoneError(Object error, StackTrace stackTrace) {
    this.error("Zone error $error", error: error, stacktrace: stackTrace);
  }

  bool logPlatformDispatcherError(Object error, StackTrace stackTrace) {
    this.error(
      'Platform Dispatcher Error: $error',
      error: error,
      stacktrace: stackTrace,
    );
    return true;
  }

  void logFlutterError(FlutterErrorDetails details) {
    if (details.silent) {
      return;
    }

    final description = details.exceptionAsString();
    error(
      'Flutter error: $description',
      error: details.exception,
      stacktrace: details.stack ?? StackTrace.current,
    );
  }

  L runLogging<L>(
    L Function() fn, [
    LogOptions logOptions = const LogOptions(),
  ]);
}

base class LoggerLogging extends Logger {
  final _logger = logging.Logger('SmallLogger');
  @override
  void error(Object message, {Object? error, StackTrace? stacktrace}) {
    _logger.severe(message, error, stacktrace);
  }

  @override
  L runLogging<L>(
    L Function() fn, [
    LogOptions logOptions = const LogOptions(),
  ]) {
    if (kReleaseMode && logOptions.logInRelease == false) {
      return fn();
    }
    logging.hierarchicalLoggingEnabled = true;

    _logger.onRecord
        .where((record) => record.loggerName == 'SmallLogger')
        .listen((record) {
          final logMessage = record.toLogMessage();
          final message =
              logOptions.logFormatter?.call(logMessage, logOptions) ??
              _formatLoggerMessage(log: logMessage, options: logOptions);

          if (logMessage.level.compareTo(logOptions.level) < 0) {
            return;
          }

          Zone.current.print(message);
        });

    return fn();
  }

  @override
  void warning(Object message) {
    _logger.warning(message);
  }

  @override
  void debug(Object message) {
    _logger.finer(message);
  }

  @override
  void info(Object message) {
    _logger.info(message);
  }

  @override
  void verbose(Object message) {
    _logger.finest(message);
  }

  @override
  Stream<LogMessage> get logs =>
      _logger.onRecord.map((record) => record.toLogMessage());
}

extension DateTimeExtension on DateTime {
  String formatTime() =>
      [hour, minute, second].map((i) => i.toString().padLeft(2, '0')).join(':');
}

String _formatLoggerMessage({
  required LogMessage log,
  required LogOptions options,
}) {
  final buffer = StringBuffer();
  if (options.showEmoji) {
    buffer.write(log.level.emoji);
    buffer.write(' ');
  }
  if (options.showTime) {
    buffer.write(log.time?.formatTime());
    buffer.write(' | ');
  }
  buffer.write(log.message);
  if (log.error != null) {
    buffer.writeln();
    buffer.write(log.error);
  }
  if (log.stackTrace != null) {
    buffer.writeln();
    buffer.write(log.stackTrace);
  }

  return buffer.toString();
}

base class LogOptions {
  final LoggerLevel level;
  final bool showTime;
  final bool showEmoji;
  final bool logInRelease;
  final LogFormatter? logFormatter;

  const LogOptions({
    this.level = LoggerLevel.info,
    this.showTime = true,
    this.showEmoji = true,
    this.logInRelease = false,
    this.logFormatter,
  });
}

base class LogMessage {
  final Object message;
  final Object? error;
  final StackTrace? stackTrace;
  final DateTime? time;
  final LoggerLevel level;

  const LogMessage({
    required this.message,
    this.error,
    this.stackTrace,
    this.time,
    required this.level,
  });
}

enum LoggerLevel implements Comparable<LoggerLevel> {
  error._(1000),
  warning._(800),
  info._(600),
  debug._(400),
  verbose._(200);

  const LoggerLevel._(this.value);
  final int value;

  @override
  int compareTo(LoggerLevel other) => value.compareTo(other.value);

  @override
  String toString() => '$LoggerLevel(${value.toString()})';
}

extension LogRecordExtension on logging.LogRecord {
  LogMessage toLogMessage() {
    return LogMessage(
      message: message,
      error: error,
      stackTrace: stackTrace,
      time: time,
      level: level.toLoggerLevel(),
    );
  }
}

extension on logging.Level {
  LoggerLevel toLoggerLevel() => switch (this) {
    logging.Level.SEVERE => LoggerLevel.error,
    logging.Level.WARNING => LoggerLevel.warning,
    logging.Level.INFO => LoggerLevel.info,
    logging.Level.FINE || logging.Level.FINER => LoggerLevel.debug,
    _ => LoggerLevel.verbose,
  };
}

extension on LoggerLevel {
  /// Transforms [LoggerLevel] to emoji
  String get emoji => switch (this) {
    LoggerLevel.error => '🔥',
    LoggerLevel.warning => '⚠️',
    LoggerLevel.info => '💡',
    LoggerLevel.debug => '🐛',
    LoggerLevel.verbose => '🔬',
  };
}
