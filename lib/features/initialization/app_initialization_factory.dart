import 'package:ai_hr/features/environment/environment_store.dart';
import 'package:ai_hr/core/utils/exceptions_tracking_manager.dart';
import 'package:ai_hr/core/utils/logger.dart';

abstract class AppInitializationFactory {
  EnvironmentStore getEnvironmentStore();

  ExceptionTrackingManager exceptionTrackingManager( EnvironmentStore environmentStore,);
}

mixin AppInitializationFactoryImpl implements AppInitializationFactory {
  @override
  EnvironmentStore getEnvironmentStore() => const EnvironmentStore();

  @override
  ExceptionTrackingManager exceptionTrackingManager(EnvironmentStore environmentStore) =>
      SentryTrackingManager(  
         logger,
         environment: environmentStore.environment.type.name,
         sentryDns: environmentStore.sentryDsn,
      );
}
