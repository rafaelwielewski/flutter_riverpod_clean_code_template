import 'package:app/src/shared/domain/models/user.dart';
import 'package:app/src/shared/domain/repository/user_repository.dart';

class FakeUserRepository implements UserRepository {
  FakeUserRepository();

  @override
  Future<User> getUser() async {
    await Future.delayed(const Duration(seconds: 2));
    return User(
      id: "1",
      name: "John Doe",
      firstName: "John",
      email: "teste@gmail.com",
    );
  }
}
