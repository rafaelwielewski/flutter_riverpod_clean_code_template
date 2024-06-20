import 'package:app/src/features/authentication/domain/models/auth.dart';
import 'package:app/src/features/authentication/domain/providers/auth_services_provider.dart';
import 'package:app/src/routing/app_router.dart';
import 'package:app/src/features/authentication/presentation/provider/auth_state_provider.dart';
import 'package:app/src/routing/app_router.gr.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_password_controller_provider.g.dart';

@riverpod
class LoginPasswordController extends _$LoginPasswordController {
  @override
  FutureOr<void> build() {}

  Future<void> loginWithPassword(String password) async {
    final authState = ref.read(authStateProvider);
    final email = authState.login;
    if (email.isNotEmpty) {
      await login(email, password);
    }
  }

  Future<void> login(String email, String password) async {
    final authService = ref.read(authServiceProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        await authService.login(AuthRequest(email: email, password: password));
        appRouter.replaceAll([const MainRoute()]);
      },
    );
  }
}
