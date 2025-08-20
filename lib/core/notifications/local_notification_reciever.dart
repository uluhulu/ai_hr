import 'dart:convert';
import 'dart:io';

import 'package:ai_hr/core/notifications/app_notification_reciever.dart';
import 'package:ai_hr/core/notifications/notification_model.dart';
import 'package:ai_hr/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationReciever implements AppNotificationReciever {
  static final LocalNotificationReciever _instance =
      LocalNotificationReciever._internal();
  static LocalNotificationReciever get instance => _instance;
  LocalNotificationReciever._internal();
  factory LocalNotificationReciever() {
    return _instance;
  }

  @override
  Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await _setupFlutterLocalNotifications();

    FirebaseMessaging.onMessage.listen(_showFlutterNotification);

    FirebaseMessaging.onMessageOpenedApp.listen(_onOpenApp);

    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _notificationModel.value = NotificationModel.fromRemoteMessage(
          initialMessage,
          hasBackground: true);
    }
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await _setupFlutterLocalNotifications();
}

bool _isFlutterLocalNotificationsInitialized = false;
late AndroidNotificationChannel _androidNotificationChannel;
late DarwinInitializationSettings _darwinInitializationSettings;

late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

Future<void> _setupFlutterLocalNotifications() async {
  if (_isFlutterLocalNotificationsInitialized) return;

  _androidNotificationChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
  );

  _darwinInitializationSettings = const DarwinInitializationSettings();

  final initializationSettings = InitializationSettings(
    android: AndroidInitializationSettings('app_icon'),
    iOS: _darwinInitializationSettings,
  );

  ///При запуске фонового обработчика требуется полная настройка уведомлений
  ///для правильной обработки входящих сообщений.

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  await _flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: _onDidRecieveNotificationResponse,
  );

  if (Platform.isAndroid) {
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_androidNotificationChannel);
  } else if (Platform.isIOS) {
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  _isFlutterLocalNotificationsInitialized = true;
}

void _onDidRecieveNotificationResponse(NotificationResponse details) {
  NotificationModel? notificationModel;
  try {
    notificationModel = NotificationModel.fromJson(
      jsonDecode(details.payload!),
    );
  } catch (_) {
    notificationModel = _localNotification[details.id];
  }
  _notificationModel.value = notificationModel;
}

Map<int, NotificationModel?> _localNotification = {};

ValueNotifier<NotificationModel?> _notificationModel = ValueNotifier(null);

NotificationModel? get initialNotification => _notificationModel.value;

ValueListenable<NotificationModel?> get currentNotification =>
    _notificationModel;

///Замысел этого паттерна:
/// 1. Паттерн "Прочитать и очистить"
/// Метод предназначен для:

/// Чтения текущего уведомления
/// Очистки его через короткую задержку
/// Предотвращения многократной обработки одного уведомления
/// 2. Зачем задержка в 150мс?
/// Синхронизация с UI: Дает UI время на обработку и отображение уведомления
/// Предотвращение состояния гонки: Обеспечивает полную обработку уведомления перед очисткой
/// Пользовательский опыт: Предотвращает слишком быстрое исчезновение уведомлений

NotificationModel? readCurrentNotification() {
  final notification = _notificationModel.value;
  if (notification == null) return null;
  Future.delayed(
    const Duration(milliseconds: 150),
    () => _notificationModel.value = null,
  );
  return notification;
}

void _showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;

  if (notification != null) {
    final message_ = NotificationModel.fromRemoteMessage(message);
    _localNotification[message_.id] = message_;

    if (Platform.isIOS) return;

    _flutterLocalNotificationsPlugin.show(
      message_.id,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _androidNotificationChannel.id,
          _androidNotificationChannel.name,
          channelDescription: _androidNotificationChannel.description,
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      payload: jsonEncode(message_.toJson()),
    );
  }
}

void _onOpenApp(RemoteMessage event) {
    _notificationModel.value =
        NotificationModel.fromRemoteMessage(event, hasBackground: true);
  }
