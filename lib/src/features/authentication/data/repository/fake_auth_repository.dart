import 'dart:async';
import 'package:app/src/features/authentication/data/dto/auth_dto.dart';
import 'package:app/src/features/authentication/domain/models/auth.dart';
import 'package:app/src/features/authentication/domain/repository/auth_repository.dart';
import 'package:app/src/shared/data/datasource/local/flutter_secure_storage_service.dart';

class FakeAuthRepository implements AuthRepository {
  final FlutterSecureStorageService storage;

  FakeAuthRepository(this.storage);

  @override
  Future<AuthResponse> signIn(AuthRequest request) async {
    await Future.delayed(const Duration(seconds: 2));
    return AuthDto.fromJson({'token': 'accessToken', 'refreshToken': 'refreshToken'});
  }

  @override
  Future<AuthResponse> refreshToken(String refreshToken) async {
    await Future.delayed(const Duration(seconds: 2));
    return AuthDto.fromJson({'token': 'accessToken', 'refreshToken': 'refreshToken'});
  }
}
