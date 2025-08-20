import 'package:flutter/foundation.dart';

class AppBarController {
  static final AppBarController _instance = AppBarController._internal();
  AppBarController._internal();
  static AppBarController get instance => _instance;

  final ValueNotifier<bool> _isOpen = ValueNotifier(false);

  ///Возвращает isOpen
  ValueListenable get isOpen => _isOpen;

  void disposeController() {
    _isOpen.dispose();
  }

  void toggleOpen() {
    _isOpen.value = !_isOpen.value;
  }
}
