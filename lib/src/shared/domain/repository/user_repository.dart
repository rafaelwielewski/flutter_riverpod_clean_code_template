import 'package:app/src/shared/domain/models/user.dart';

abstract class UserRepository {
  Future<User> getUser();
}
