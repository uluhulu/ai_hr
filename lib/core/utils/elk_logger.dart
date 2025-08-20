import 'dart:convert';

import 'package:ai_hr/core/utils/unique_identifier_wrapper.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:translit/translit.dart';
import 'package:typed_data/typed_data.dart';

class ElkLogger {
  final MqttServerClient mqtt;
  final topic = 'mpp_device_logs';
  ElkLogger({required this.mqtt});

  void logInfo(String? message) =>
      _log(Translit().toTranslit(source: message ?? ''), 'INFO');
  void logError(String? message) =>
      _log(Translit().toTranslit(source: message ?? ''), 'ERR');
  void logWarning(String? message) =>
      _log(Translit().toTranslit(source: message ?? ''), 'WARN');
  void logRoute(String? route) => _log(
    'Navigate to ${Translit().toTranslit(source: route ?? '')}',
    'ROUTE',
  );
  void logOnRequest(Map<String, dynamic> headers, dynamic body, String url) =>
      _log(
        {
          '"headers"': '"$headers"',
          '"body"': '"$body"',
          '"url"': '"$url"',
        }.toString(),
        'ON_REQUEST',
      );
  void logOnResponse(
    dynamic body,
    int code,
    Map<String, dynamic> headers,
    String url,
  ) => _log(
    {
      '"headers"': '"$headers"',
      '"statusCode"': code,
      '"body"': '"$body"',
      '"url"': '"$url"',
    }.toString(),
    'ON_RESPONSE',
  );
  void logOnErrorDio(
    String message,
    String url,
    int? code,
    dynamic body,
    Map<String, dynamic>? headers,
  ) => _log(
    {
      '"errorMessage"': message,
      '"url"': '"$url"',
      '"statusCode"': code,
      '"body"': '"$body"',
      '"headers"': '"$headers"',
    }.toString(),
    'ON_REQUEST_FAIL',
  );
  void logOnTap(String message) => _log('Tap: $message', 'TAP');

  Future _log(String? message, String logLevel) async {
    final builder = MqttClientPayloadBuilder();
    final _buf = Uint8Buffer();
    _buf.addAll(
      utf8.encode(json.encode(await _payloadData(message, logLevel))),
    );
    builder.addBuffer(_buf);
  }

  Future<Map<String, dynamic>> _payloadData(
    String? message,
    String logLevel,
  ) async {
    final DateTime now = DateTime.now();
    final String? uniqueId =
        await UniqueIdentifierWrapperImpl().uniqueIdentifier;
    return {
      "date": "${now.year}-${now.month}-${now.day}",
      "time": "${now.hour}:${now.minute}:${now.second}",
      "deviceId": uniqueId ?? "",
      "message": message ?? "",
      "logLevel": logLevel,
    };
  }
}
