import 'dart:async';
import 'package:app/src/shared/data/datasource/local/flutter_secure_storage_service.dart';
import 'package:app/src/shared/domain/models/user.dart';
import 'package:app/src/shared/domain/repository/local_user_repository.dart';

class LocalUserRepositoryImpl implements LocalUserRepository {
  final FlutterSecureStorageService storage;

  LocalUserRepositoryImpl(this.storage);

  @override
  Future<User> getInitialUser() async {
    return User(
      id: '',
      name: '',
      firstName: await storage.getItem('firstName'),
      email: '',
    );
  }

  @override
  Future<void> updateFirstName(String firstName) async {
    await storage.setItem('firstName', firstName);
  }

  @override
  Future<void> clearAll() async {
    await storage.deleteItem('firstName');
  }
}
