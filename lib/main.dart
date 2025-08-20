import 'dart:async';

import 'package:ai_hr/core/utils/logger.dart';
import 'package:ai_hr/main_app_navigation.dart';
import 'package:flutter/material.dart';

void main() async {
  logger.runLogging(
    () => runZonedGuarded(() => runApp(const MainApp()), logger.logZoneError),
    const LogOptions(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavifationWidget(),
    );
  }
}


//  () => runZonedGuarded(() => 
    
//     await SentryFlutter.init(
//     (options) {
//       options.dsn = 'https://a03009c8cc897ec1307eb81a37cc74e9@o4509609030582272.ingest.de.sentry.io/4509609031041104';
//       // Adds request headers and IP for users, for more info visit:
//       // https://docs.sentry.io/platforms/dart/guides/flutter/data-management/data-collected/
//       options.sendDefaultPii = true;
//       // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
//       // We recommend adjusting this value in production.
//       options.tracesSampleRate = 1.0;
//       // The sampling rate for profiling is relative to tracesSampleRate
//       // Setting to 1.0 will profile 100% of sampled transactions:
//       options.profilesSampleRate = 1.0;
//     },
//     appRunner: () => 
    
//     runApp(SentryWidget(child: const MainApp()), logger.logZoneError),
//     const LogOptions(),
//   )),
//   );