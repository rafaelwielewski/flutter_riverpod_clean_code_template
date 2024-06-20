import 'package:app/src/app.dart';
import 'package:app/src/shared/domain/exceptions/async_error_logger.dart';
import 'package:app/src/shared/domain/exceptions/error_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await dotenv.load(fileName: ".env");

  final container = ProviderContainer(
    overrides: [],
    observers: [AsyncErrorLogger()],
  );

  final errorLogger = container.read(errorLoggerProvider);
  registerErrorHandlers(errorLogger);

  runApp(
    UncontrolledProviderScope(container: container, child: const MyApp()),
  );
}

void registerErrorHandlers(ErrorLogger errorLogger) {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    errorLogger.logError(details.exception, details.stack);
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    errorLogger.logError(error, stack);
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Oops, algo deu errado!'),
      ),
      body: const Center(child: Text('Ocorreu um erro inesperado ao carregar a tela, por favor, tente novamente.', textAlign: TextAlign.center)),
    );
  };
}
