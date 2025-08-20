import 'package:ai_hr/core/utils/elk_logger.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

base class Dependencies {
  final SharedPreferences sharedPreferences;
  final AppDatabase appDatabase;

  final DioManager dioManager;

  final ElkLogger elkLogger;

  //Репозитории (Data Layer)
  final IAuthRepository authRepository;
  final IProfileRepository profileRepository;
  final IMarkRepository markRepository;
  final PhoneRepository phoneRepository;
  final TaskRepository taskRepository;
  final CallRepository callRepository;
  final WorkScheduleRepository workScheduleRepository;
  final INotificationRepository notificationRepository;
  final IStoresRepository storesRepository;
  final IProductRepository productRepository;
  final UpdateVersionRepository updateVersionRepository;
  final UpdateUriRepository updateUriRepository;
  final RequestLogsRepository requestLogsRepository;
  final PingRepository pingRepository;

  /// BLoC/Cubit (Business Logic Layer)

  ///Настройка приложения (тема, язык)
  final SettingsBloc settingsBloc;

  ///Локализация
  final LabelsModelCubit localizationCubit;

  ///Пользовательские данные
  final UserModelCubit userModelCubit;

  /// Категории
  final CategoriesCubit categoriesCubit;

  Dependencies({
    required this.sharedPreferences,
    required this.appDatabase,
    required this.dioManager,
    required this.elkLogger,
    required this.authRepository,
    required this.profileRepository,
    required this.markRepository,
    required this.phoneRepository,
    required this.taskRepository,
    required this.callRepository,
    required this.workScheduleRepository,
    required this.notificationRepository,
    required this.storesRepository,
    required this.productRepository,
    required this.updateVersionRepository,
    required this.updateUriRepository,
    required this.requestLogsRepository,
    required this.pingRepository,
    required this.settingsBloc,
    required this.localizationCubit,
    required this.userModelCubit,
    required this.categoriesCubit,
  });

  Future<void> logout() async {
    dioManager.clearToken();
    userModelCubit.setUser(null);
    await phoneRepositor.setPhoneIfNullDelete(null, false);
  }
}

final class InitializationResult {
  const InitializationResult({
    required this.dependencies,
    required this.msSpent,
  });
  final Dependencies dependencies;
  final int msSpent;

  @override
  String toString() {
    return 'InitializationResult{dependencies: $dependencies, msSpent: $msSpent}';
  }
}
