import 'package:app/src/features/authentication/domain/providers/auth_services_provider.dart';
import 'package:app/src/features/authentication/presentation/provider/auth_state_provider.dart';
import 'package:app/src/features/authentication/presentation/provider/logout_controller_provider.dart';
import 'package:app/src/shared/domain/enums/color_type.dart';
import 'package:app/src/shared/presentation/provider/user_controller.dart';
import 'package:app/src/shared/presentation/widgets/custom_button.dart';
import 'package:app/src/shared/presentation/widgets/popup_with_icon.dart';
import 'package:app/src/utils/async_value_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:app/src/shared/presentation/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class MainScreen extends HookConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(userControllerProvider.notifier).getUser();
        final authState = ref.read(authStateProvider);
        if (authState.isBioAvailable && !authState.isBioActivated && !authState.isBioAuthRequested) {
          showCustomBottomDialog(
            context: context,
            description: 'Ative sua biometria para uma experiência mais segura e rápida.',
            iconData: Icons.fingerprint_outlined,
            confirmText: 'Ativar',
            onConfirm: () => ref.read(authServiceProvider).activateBio(),
            refuseText: 'Agora não',
          );
        }
      });
      return null;
    }, const []);

    final state = ref.watch(userControllerProvider);
    ref.listen<AsyncValue<void>>(
      userControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    return RefreshIndicator(
      color: ThemeProvider.of(context).appColors.secondary,
      backgroundColor: ThemeProvider.of(context).themeColors.background,
      onRefresh: () async {
        await ref.read(userControllerProvider.notifier).getUser();
      },
      child: DefaultLayout(
        isLoadingPage: state is AsyncLoading,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Spacer(),
            CustomButton(
              color: ColorType.primary,
              borderColor: ThemeProvider.of(context).themeColors.border,
              border: true,
              text: 'Sair',
              onPressed: () => ref.read(logoutControllerProvider.notifier).logout(),
              isValid: () => true,
            ),
          ],
        ),
      ),
    );
  }
}
