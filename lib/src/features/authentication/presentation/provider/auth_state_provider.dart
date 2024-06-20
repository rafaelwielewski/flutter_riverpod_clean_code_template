import 'package:app/src/features/authentication/domain/models/auth.dart';
import 'package:app/src/features/authentication/domain/providers/local_auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthState extends _$AuthState {
  @override
  Auth build() {
    return Auth.initial();
  }

  Auth getAuthState() {
    return state;
  }

  Future<void> initFromLocalStorage() async {
    final auth = await ref.read(localAuthRepositoryProvider).getInitialAuth();
    state = auth;
  }

  void updateIsLoggedIn(bool isLoggedIn) {
    state = state.copyWith(isLoggedIn: isLoggedIn);
  }

  void updateIsBioAvailable(bool isBioAvailable) {
    state = state.copyWith(isBioAvailable: isBioAvailable);
  }

  void updateIsBioActivated(bool isBioActivated) {
    state = state.copyWith(isBioActivated: isBioActivated);
  }

  void updateIsBioAuthRequested(bool isBioAuthRequested) {
    state = state.copyWith(isBioAuthRequested: isBioAuthRequested);
  }

  void updateIsBioLoginAvailable(bool isBioLoginAvailable) {
    state = state.copyWith(isBioLoginAvailable: isBioLoginAvailable);
  }

  void clearAll() {
    state = Auth.initial();
  }
}
