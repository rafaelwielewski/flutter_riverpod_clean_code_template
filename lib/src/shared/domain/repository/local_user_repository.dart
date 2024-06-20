import 'package:app/src/shared/domain/models/user.dart';

abstract class LocalUserRepository {
  Future<User> getInitialUser();
  Future<void> updateFirstName(String firstName);
  Future<void> clearAll();
}
