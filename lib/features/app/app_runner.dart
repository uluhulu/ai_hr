import 'package:ai_hr/core/notifications/app_notification_service.dart';
import 'package:ai_hr/features/initialization/app_initialization_factory.dart';
import 'package:ai_hr/core/utils/app_bloc_observer.dart';
import 'package:ai_hr/core/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;

final class AppRunner with AppInitializationFactoryImpl {
  const AppRunner();

  Future<void> initializeAndRun() async {
    final binding = WidgetsFlutterBinding.ensureInitialized();

    binding.deferFirstFrame();

    /// логирование ошибок фремйворка

    FlutterError.onError = logger.logFlutterError;

    /// логирование ошибо изолятв

    WidgetsBinding.instance.platformDispatcher.onError =
        logger.logPlatformDispatcherError;

    /// Установка BlocObserver
    Bloc.observer = AppBlocObserver();

    Bloc.transformer = bloc_concurrency.sequential();

    final environmentStore = getEnvironmentStore();

    await AppNotificationService().initialize();
  }
}
