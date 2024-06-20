import 'package:app/src/features/authentication/domain/models/auth.dart';

abstract class LocalAuthRepository {
  Future<Auth> getInitialAuth();
  Future<String> getAccessToken();
  Future<String> getRefreshToken();
  Future<void> setBio(bool? isBioActivated, bool? isBioAuthRequested);
  Future<void> setTokens(AuthResponse authResponse);
  Future<void> setLogin(String email);
  Future<void> logout();
}
