import 'package:app/src/routing/app_router.gr.dart';
import 'package:app/src/shared/presentation/styles/system_ui_overlay.dart';
import 'package:auto_route/auto_route.dart';
import 'package:app/src/features/authentication/presentation/provider/login_bio_controller_provider.dart';
import 'package:app/src/features/authentication/presentation/provider/logout_controller_provider.dart';
import 'package:app/src/shared/domain/enums/color_type.dart';
import 'package:app/src/features/authentication/presentation/provider/auth_state_provider.dart';
import 'package:app/src/shared/presentation/styles/styles.dart';
import 'package:app/src/shared/presentation/widgets/custom_button.dart';
import 'package:app/src/shared/presentation/widgets/custom_image.dart';
import 'package:app/src/shared/presentation/widgets/loading_widget.dart';
import 'package:app/src/utils/async_value_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<HomeScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(loginBioControllerProvider.notifier).loginBio();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(
      loginBioControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    List<Widget> buildButtons(BuildContext context) {
      return [
        const Spacer(),
        if (!(ref.watch(authStateProvider).isBioLoginAvailable))
          CustomButton(
            color: ColorType.secondary,
            text: 'Entrar',
            onPressed: () => context.router.push(LoginRoute()),
            isValid: () => true,
          ),
        if (ref.watch(authStateProvider).isBioLoginAvailable)
          CustomButton(
            color: ColorType.secondary,
            text: 'Entrar',
            onPressed: () => ref.watch(loginBioControllerProvider.notifier).loginBio(),
            isValid: () => true,
          ),
        if (ref.watch(authStateProvider).login.isEmpty)
          CustomButton(
            text: 'Cadastrar',
            color: ColorType.primary,
            border: true,
            onPressed: () => {},
            isValid: () => true,
          ),
        if (ref.watch(authStateProvider).login.isNotEmpty)
          CustomButton(
            text: 'Sair',
            color: ColorType.primary,
            border: true,
            onPressed: () => ref.watch(logoutControllerProvider.notifier).logout(),
            isValid: () => true,
          ),
      ];
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: buildSystemUiOverlayStyleWithColor(
        navBrightness: Brightness.light,
        statusBrightness: Brightness.light,
        backgroundColor: ThemeProvider.of(context).appColors.primary,
      ),
      child: Scaffold(
        backgroundColor: ThemeProvider.of(context).appColors.primary,
        resizeToAvoidBottomInset: true,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
                child: ref.watch(loginBioControllerProvider) is AsyncLoading
                    ? LoadingWidget(size: 150, color: ThemeProvider.of(context).appColors.white)
                    : CustomImage(
                        path: 'assets/logo/logo.png',
                        size: 150,
                        color: ThemeProvider.of(context).appColors.white,
                      )),
            if (ref.watch(loginBioControllerProvider) is! AsyncLoading)
              SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: WidthSpacing.medium),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        ...buildButtons(context),
                        SizedBox(height: HeightSpacing.medium),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
