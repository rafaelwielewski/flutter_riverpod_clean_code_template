import 'package:app/src/shared/data/repository/fake_user_repository.dart';
import 'package:app/src/shared/domain/repository/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository_provider.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) {
  //return UserRepositoryImpl(ref.watch(httpServiceProvider));
  return FakeUserRepository();
}
