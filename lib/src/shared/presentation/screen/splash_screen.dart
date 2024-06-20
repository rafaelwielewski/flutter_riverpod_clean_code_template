import 'package:app/src/features/authentication/presentation/provider/auth_state_provider.dart';
import 'package:app/src/shared/presentation/provider/user_controller.dart';
import 'package:auto_route/auto_route.dart';
import 'package:app/src/routing/app_router.dart';
import 'package:app/src/routing/app_router.gr.dart';
import 'package:app/src/shared/presentation/provider/theme_provider.dart';
import 'package:app/src/shared/presentation/styles/system_ui_overlay.dart';
import 'package:app/src/shared/presentation/styles/theme_default.dart';
import 'package:app/src/utils/device_dimensions_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SplashScreenPage extends ConsumerStatefulWidget {
  const SplashScreenPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends ConsumerState<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await ref.read(authStateProvider.notifier).initFromLocalStorage();
    await ref.read(userControllerProvider.notifier).initFromLocalStorage();
    await appRouter.replaceAll([const HomeRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    DeviceDimensions.init(context);
    return MyTheme(
      light: lightTheme,
      dark: darkTheme,
      child: Builder(
        builder: (context) => AnnotatedRegion<SystemUiOverlayStyle>(
          value: buildSystemUiOverlayStyle(context),
          child: Container(),
        ),
      ),
    );
  }
}
