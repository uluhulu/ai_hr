import 'package:ai_hr/core/notifications/app_notification_reciever.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AppNotificationService {
  static final AppNotificationService _instance =
      AppNotificationService._internal();

  static AppNotificationService get instance => _instance;

  factory AppNotificationService() {
    return _instance;
  }

  AppNotificationService._internal();

  Future<void> initialize() async {
    await AppNotificationReciever().initialize();
  }

  Future<String?> get token async {
    final permission = await requestPermission();
    return switch (permission) {
      NotificationPermission.granted => FirebaseMessaging.instance.getToken(),
      NotificationPermission.denied => null,
    };
  }

  Future<NotificationPermission> requestPermission() async {
    final settings = await FirebaseMessaging.instance.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      return NotificationPermission.granted;
    } else {
      return NotificationPermission.denied;
    }
  }
}

enum NotificationPermission { granted, denied }
