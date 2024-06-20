import 'dart:convert';
import 'package:app/src/features/authentication/domain/models/auth.dart';

class AuthDto {
  static fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      accessToken: json['token'],
      refreshToken: json['refreshToken'],
    );
  }

  static toBase64(AuthRequest authRequest) {
    return base64Encode(utf8.encode('${authRequest.email}:${authRequest.password}'));
  }
}
