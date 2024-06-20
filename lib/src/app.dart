import 'package:app/src/features/authentication/presentation/provider/auth_state_provider.dart';
import 'package:app/src/routing/app_router.dart';
import 'package:app/src/routing/app_router.gr.dart';
import 'package:app/src/shared/presentation/styles/styles.dart';
import 'package:app/src/shared/presentation/styles/theme_default.dart';
import 'package:app/src/utils/device_dimensions_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  DateTime appPausedTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      appPausedTime = DateTime.now();
    } else if (state == AppLifecycleState.resumed) {
      final appResumedTime = DateTime.now();
      final appPausedDuration = appResumedTime.difference(appPausedTime);
      if (appPausedDuration.inSeconds >= 60) {
        if (ref.watch(authStateProvider.notifier).getAuthState().isBioLoginAvailable &&
            ref.watch(authStateProvider.notifier).getAuthState().isLoggedIn) {
          appPausedTime = DateTime.now();
          appRouter.push(const LockRoute());
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      DeviceDimensions.init(context);
    });
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MyTheme(
      light: lightTheme,
      dark: darkTheme,
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            routerConfig: appRouter.config(),
            debugShowCheckedModeBanner: false,
            onGenerateTitle: (BuildContext context) => 'RW App',
            theme: ThemeData(
              useMaterial3: true,
              textSelectionTheme: TextSelectionThemeData(
                  cursorColor: ThemeProvider.of(context).appColors.primary,
                  selectionColor: ThemeProvider.of(context).themeColors.inputText.withOpacity(0.3),
                  selectionHandleColor: ThemeProvider.of(context).appColors.primary),
              inputDecorationTheme: InputDecorationTheme(
                errorStyle: AppTypography.inputError(context),
              ),
            ),
          );
        },
      ),
    );
  }
}
