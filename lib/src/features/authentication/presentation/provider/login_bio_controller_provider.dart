import 'package:app/src/features/authentication/domain/providers/auth_services_provider.dart';
import 'package:app/src/features/authentication/presentation/provider/auth_state_provider.dart';
import 'package:app/src/routing/app_router.dart';
import 'package:app/src/routing/app_router.gr.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_bio_controller_provider.g.dart';

@riverpod
class LoginBioController extends _$LoginBioController {
  @override
  FutureOr<void> build() {}

  Future<void> loginBio() async {
    if (state is AsyncLoading) return;
    if (!ref.read(authStateProvider).isBioLoginAvailable) return;
    if (ref.read(authStateProvider).isLoggedIn) return;
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard(() async {
      final loggedIn = await ref.read(authServiceProvider).loginBio();
      if (loggedIn) appRouter.replaceAll([const MainRoute()]);
    });
  }
}
