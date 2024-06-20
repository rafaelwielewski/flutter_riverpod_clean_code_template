import 'dart:convert';
import 'package:app/src/features/authentication/data/dto/auth_dto.dart';
import 'package:app/src/features/authentication/domain/models/auth.dart';
import 'package:app/src/features/authentication/domain/repository/auth_repository.dart';
import 'package:app/src/shared/domain/models/device.dart';
import 'package:app/src/shared/data/datasource/remote/http_request.dart';
import 'package:app/src/shared/data/datasource/remote/http_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final HttpService httpClient;

  AuthRepositoryImpl(this.httpClient);

  @override
  Future<AuthResponse> signIn(AuthRequest request) async {
    final response = await httpClient.post(
      HttpRequest(
        '/authentication',
        data: jsonEncode(Device.toJson()),
        authType: AuthType.authBasic,
        request: request,
      ),
    );
    return AuthDto.fromJson(response);
  }

  @override
  Future<AuthResponse> refreshToken(String refreshToken) async {
    final response = await httpClient.post(
      HttpRequest(
        '/refresh-token',
        data: jsonEncode({"refreshToken": refreshToken}),
        authType: AuthType.basic,
      ),
    );
    return AuthDto.fromJson(response);
  }
}
