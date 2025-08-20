import 'package:ai_hr/core/utils/exceptions_tracking_manager.dart';
import 'package:ai_hr/features/environment/environment_store.dart';

final class InitializationProcess {
  final ExceptionTrackingManager _trackingManager;
  final EnvironmentStore _environmentStore;

  InitializationProcess({
    required ExceptionTrackingManager trackingManager,
    required EnvironmentStore environmentStore,
  }) : _trackingManager = trackingManager,
       _environmentStore = environmentStore;

       
}
