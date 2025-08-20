import 'package:firebase_messaging/firebase_messaging.dart';

/// Модель истории уведомлений
class NotificationModel {
  /// Идентификатор уведомления
  final int id;

  /// Заголовок уведомления
  final String title;

  /// Текст уведомления
  final String? content;

  /// Приоритет
  ///
  /// 0 — обычный приоритет
  ///
  /// 1 — повышенный приоритет
  final int? priority;

  /// Дата создания
  final DateTime? created;

  /// Дата чтения
  final DateTime? read;

  /// Дата доставки
  final DateTime? delivered;

  /// Дата и время отправки
  /// (передачи сервису
  /// доставки уведомлений)
  final DateTime? sent;

  /// Конструктор
  const NotificationModel({
    required this.id,
    required this.title,
    required this.content,
    required this.created,
    required this.read,
    required this.delivered,
    required this.sent,
    required this.priority,
  });

  ///{no-doc}
  factory NotificationModel.fromJson(Map<String, dynamic> map) => NotificationModel(
        id: map['id'] as int,
        title: map['title'] as String,
        content: map['content'] as String?,
        created: _parseDT(map['created']),
        read: _parseDT(map['read']),
        delivered: _parseDT(map['delivered']),
        sent: _parseDT(map['sent']),
        priority: map['priority'] as int?,
      );

  factory NotificationModel.fromNull() => NotificationModel(
        id: -1,
        title: 'fromNull',
        content: 'fromNull content',
        created: null,
        read: null,
        delivered: DateTime.now(),
        sent: DateTime.now(),
        priority: 1,
      );

  bool get readByUser => read != null;

  bool get noneReadByUser => !readByUser;

  NotificationPriority get priorityValue => priority == null || priority == 0 ? NotificationPriority.normal : NotificationPriority.high;

  factory NotificationModel.fromRemoteMessage(RemoteMessage message, {bool hasBackground = false}) => NotificationModel(
        id: int.tryParse(message.data['id']) ?? -1,
        title: message.notification?.title ?? '',
        content: message.notification?.body ?? '',
        created: null,
        read: null,
        delivered: hasBackground ? DateTime.now() : DateTime.now().toUtc(),
        sent: hasBackground ? DateTime.now() : DateTime.now().toUtc(),
        priority: 1,
      );

  ///{no-doc}
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'created': created?.toIso8601String(),
        'read': read?.toIso8601String(),
        'delivered': delivered?.toIso8601String(),
        'sent': sent?.toIso8601String(),
        'priority': priority,
      };

  /// Копирование
  NotificationModel copyWith({
    int? id,
    String? title,
    String? content,
    int? priority,
    DateTime? created,
    DateTime? read,
    DateTime? delivered,
    DateTime? sent,
  }) =>
      NotificationModel(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        priority: priority ?? this.priority,
        created: created ?? this.created,
        read: read ?? this.read,
        delivered: delivered ?? this.delivered,
        sent: sent ?? this.sent,
      );
}

DateTime? _parseDT(Object? timestamp) {
  if (timestamp == null) return null;
  if (timestamp is int) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000).toLocal();
  }
  if (timestamp is String) {
    final date = DateTime.tryParse(timestamp);
    if (date == null) return null;
    return DateTime.utc(date.year, date.month, date.day, date.hour, date.minute, date.second).toLocal();
    // return .toUtc().toLocal();
  }
  return null;
}

enum NotificationPriority {
  /// Обычный приоритет
  normal,

  /// Повышенный приоритет
  high
}
// NotificationStatus notificationStatusFromString(String status) {
//   switch (status) {
//     case 'queued':
//       return NotificationStatus.queued;
//     case 'sent':
//       return NotificationStatus.sent;
//     case 'error':
//       return NotificationStatus.error;
//     case 'cancelled':
//       return NotificationStatus.cancelled;
//     default:
//       return NotificationStatus.queued;
//   }
// }
//
// enum NotificationStatus {
//   /// Задания отправки ожидают выполнения
//   queued,
//
//   /// Уведомление отправлено
//   sent,
//
//   /// Произошла ошибка отправки
//   error,
//
//   /// Отменена или невозможна
//   cancelled
// }

class NotificationsCountResponseBody {
  /// {@macro work_schedule_request_body}
  const NotificationsCountResponseBody({required this.count});

  /// Token
  final int count;

  /// Преобразование в [Map]
  NotificationsCountResponseBody.fromJson(Map<String, dynamic> json) : count = json['count'] as int;
}
