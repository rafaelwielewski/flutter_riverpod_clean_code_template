import 'package:app/src/shared/domain/models/user.dart';
import 'package:app/src/shared/domain/providers/local_user_repository_provider.dart';
import 'package:app/src/shared/domain/providers/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';

@Riverpod(keepAlive: true)
class UserController extends _$UserController {
  @override
  FutureOr<User> build() async {
    return User.initial();
  }

  Future<void> initFromLocalStorage() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(localUserRepositoryProvider).getInitialUser());
  }

  Future<void> getUser() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(userRepositoryProvider).getUser());
  }

  void updateEmail(String email) {
    state.whenData((user) {
      state = AsyncValue.data(user.copyWith(email: email));
    });
  }

  void updateFirstName(String firstName) {
    state.whenData((user) {
      state = AsyncValue.data(user.copyWith(firstName: firstName));
    });
  }

  void clearAll() {
    state = AsyncValue.data(User.initial());
  }
}
