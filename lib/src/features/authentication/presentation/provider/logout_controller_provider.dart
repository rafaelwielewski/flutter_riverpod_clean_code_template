import 'package:app/src/features/authentication/domain/providers/auth_services_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_controller_provider.g.dart';

@riverpod
class LogoutController extends _$LogoutController {
  @override
  FutureOr<void> build() {}

  Future<void> logout() async {
    final authService = ref.read(authServiceProvider);
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard(() => authService.logout());
  }
}
