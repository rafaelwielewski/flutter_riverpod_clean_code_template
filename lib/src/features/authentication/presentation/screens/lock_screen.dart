import 'package:auto_route/auto_route.dart';
import 'package:app/src/features/authentication/domain/services/local_auth_services.dart';
import 'package:app/src/features/authentication/presentation/provider/login_bio_controller_provider.dart';
import 'package:app/src/features/authentication/presentation/provider/logout_controller_provider.dart';
import 'package:app/src/routing/app_router.dart';
import 'package:app/src/shared/domain/enums/color_type.dart';
import 'package:app/src/features/authentication/presentation/provider/auth_state_provider.dart';
import 'package:app/src/shared/presentation/styles/styles.dart';
import 'package:app/src/shared/presentation/widgets/custom_button.dart';
import 'package:app/src/shared/presentation/widgets/custom_image.dart';
import 'package:app/src/shared/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class LockScreen extends ConsumerStatefulWidget {
  const LockScreen({super.key});

  @override
  ConsumerState<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends ConsumerState<LockScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loginBio();
    });
  }

  Future<void> loginBio() async {
    final auth = await ref.read(localAuthServiceProvider).authorize();
    if (auth) {
      await appRouter.maybePop();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> buildButtons(BuildContext context) {
      return [
        const Spacer(),
        if (ref.watch(authStateProvider).isBioLoginAvailable)
          CustomButton(
            color: ColorType.secondary,
            text: 'Entrar',
            onPressed: () {
              loginBio();
            },
            isValid: () => true,
          ),
        CustomButton(
          text: 'Sair',
          color: ColorType.primary,
          border: true,
          onPressed: () => {
            ref.watch(logoutControllerProvider.notifier).logout(),
          },
          isValid: () => true,
        ),
      ];
    }

    return Scaffold(
      backgroundColor: ThemeProvider.of(context).appColors.primary,
      resizeToAvoidBottomInset: true,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
              child: ref.watch(loginBioControllerProvider) is AsyncLoading
                  ? LoadingWidget(size: 150, color: ThemeProvider.of(context).appColors.secondary)
                  : const CustomImage(
                      path: 'assets/logo/logo.png',
                      size: 150,
                    )),
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
    );
  }
}
