import 'package:app/src/features/authentication/domain/models/auth.dart';
import 'package:app/src/features/authentication/domain/repository/local_auth_repository.dart';
import 'package:app/src/shared/data/datasource/local/flutter_secure_storage_service.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthRepositoryImpl implements LocalAuthRepository {
  final FlutterSecureStorageService storage;

  LocalAuthRepositoryImpl(this.storage);

  @override
  Future<String> getAccessToken() async {
    return await storage.getItem('accessToken');
  }

  @override
  Future<String> getRefreshToken() async {
    return await storage.getItem('refreshToken');
  }

  @override
  Future<Auth> getInitialAuth() async {
    bool isBioSupported = await LocalAuthentication().isDeviceSupported();
    final refreshToken = await storage.getItem('refreshToken');
    final isBioActivated = await storage.getItem('isBioActivated');
    final isBioRequested = await storage.getItem('isBioRequested');
    final login = await storage.getItem('login');

    return Auth(
      login: login,
      isLoggedIn: false,
      isBioAvailable: isBioSupported,
      isBioActivated: isBioActivated == 'true',
      isBioAuthRequested: isBioRequested == 'true',
      isBioLoginAvailable: isBioActivated == 'true' && isBioSupported && refreshToken.isNotEmpty,
    );
  }

  @override
  Future<void> setBio(bool? isBioActivated, bool? isBioAuthRequested) async {
    if (isBioActivated != null) await storage.setItem('isBioActivated', isBioActivated.toString());
    if (isBioAuthRequested != null) await storage.setItem('isBioRequested', isBioAuthRequested.toString());
  }

  @override
  Future<void> setTokens(AuthResponse authResponse) async {
    await storage.setItem('accessToken', authResponse.accessToken);
    await storage.setItem('refreshToken', authResponse.refreshToken);
  }

  @override
  Future<void> setLogin(String login) async {
    await storage.setItem('login', login);
  }

  @override
  Future<void> logout() async {
    await storage.deleteItem('accessToken');
    await storage.deleteItem('refreshToken');
    await storage.deleteItem('login');
  }
}
