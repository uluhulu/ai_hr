import 'package:ai_hr/core/notifications/local_notification_reciever.dart';

abstract class AppNotificationReciever {
  factory AppNotificationReciever () => LocalNotificationReciever();

  Future <void> initialize ();
}