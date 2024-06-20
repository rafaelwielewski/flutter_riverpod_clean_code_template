import 'package:app/src/features/authentication/domain/models/auth.dart';

abstract class AuthRepository {
  Future<AuthResponse> signIn(AuthRequest request);
  Future<AuthResponse> refreshToken(String refreshToken);
}
