import 'package:ai_hr/features/environment/environment.dart';
import 'package:ai_hr/core/utils/flavor.dart';

class EnvironmentStore {
  const EnvironmentStore();

  Environment get environment => Environment.fromString(appFlavor);

  /// flutter run --dart-define=SENTRY_DSN=https://a03009c8cc897ec1307eb81a37cc74e9@o4509609030582272.ingest.de.sentry.io/4509609031041104

  String get sentryDsn => String.fromEnvironment("SENTRY_DSN");

  bool get enableTrackingManager => sentryDsn.isNotEmpty;
}
