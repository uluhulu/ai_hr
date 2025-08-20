import 'package:ai_hr/core/utils/logger.dart';
import 'package:ai_hr/core/utils/string_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logger.info('Bloc created: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    final buffer =
        StringBuffer()
          ..writeln('Bloc: ${bloc.runtimeType} | ${event.runtimeType}')
          ..write('Event: ${event.toString().limit(200)}');
    logger.info(buffer.toString());
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    final buffer =
        StringBuffer()
          ..write('Bloc : ${bloc.runtimeType} |')
          ..writeln('${transition.event.runtimeType}')
          ..write(
            'from: ${transition.currentState.runtimeType} to: ${transition.nextState.runtimeType}',
          )
          ..write('New State: ${transition.nextState.toString().limit(100)}');
    logger.info(buffer.toString());
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.error(
      'Bloc: ${bloc.runtimeType} | $error',
      error: error,
      stacktrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }
}
