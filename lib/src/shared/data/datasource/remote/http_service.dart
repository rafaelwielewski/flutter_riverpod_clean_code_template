import 'package:app/src/features/authentication/domain/services/auth_services.dart';
import 'package:app/src/shared/data/datasource/remote/http_request.dart';

abstract class HttpService {
  String get baseUrl;
  String get apiKey;
  String get basicToken;

  void setAuthService(AuthService authService);

  Future<Map<String, dynamic>> get(HttpRequest request);

  Future<Map<String, dynamic>> post(HttpRequest request);

  Future<Map<String, dynamic>> put(HttpRequest request);

  Future<Map<String, dynamic>> delete(HttpRequest request);
}

enum AuthType { basic, bearer, authBasic, none }

enum HttpMethod { get, post, put, delete }
