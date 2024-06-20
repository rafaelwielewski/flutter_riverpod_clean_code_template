import 'package:app/src/features/authentication/data/dto/auth_dto.dart';
import 'package:app/src/features/authentication/domain/services/auth_services.dart';
import 'package:app/src/shared/domain/exceptions/app_exception.dart';
import 'package:app/src/features/authentication/domain/models/auth.dart';
import 'package:app/src/shared/data/datasource/remote/http_request.dart';
import 'package:app/src/shared/data/datasource/remote/http_service.dart';
import 'package:app/src/utils/log_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_http_service.g.dart';

@Riverpod(keepAlive: true)
HttpService httpService(HttpServiceRef ref) {
  return DioHttpService(Dio());
}

class DioHttpService extends HttpService {
  final Dio dio;
  late AuthService authService;

  DioHttpService(this.dio, {AuthService? authService}) {
    dio.options = dioBaseOptions;
  }

  @override
  void setAuthService(AuthService authService) {
    this.authService = authService;
  }

  BaseOptions get dioBaseOptions => BaseOptions(
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      );

  @override
  String get baseUrl => dotenv.env['BASE_URL'] ?? '';
  @override
  String get apiKey => dotenv.env['API_KEY'] ?? '';
  @override
  String get basicToken => dotenv.env['BASIC_TOKEN'] ?? '';

  @override
  Future<Map<String, dynamic>> get(HttpRequest request) async {
    final res = await guard(request, HttpMethod.get);
    return res;
  }

  @override
  Future<Map<String, dynamic>> post(HttpRequest request) async {
    final res = await guard(request, HttpMethod.post);
    return res;
  }

  @override
  Future<Map<String, dynamic>> put(HttpRequest request) async {
    final res = await guard(request, HttpMethod.put);
    return res;
  }

  @override
  Future<Map<String, dynamic>> delete(HttpRequest request) async {
    final res = await guard(request, HttpMethod.delete);
    return res;
  }

  Future<Map<String, dynamic>> guard(HttpRequest request, HttpMethod method) async {
    try {
      final response = await execute(request, method);
      LogUtils.log('Response: ${response.data}');
      if (response.data is Map<String, dynamic>) {
        return response.data;
      } else {
        return {};
      }
    } on DioException catch (e) {
      LogUtils.log('Error: ${e.response?.data}');
      if (e.response?.statusCode == 401 && request.authType == AuthType.bearer) {
        await authService.refreshAccessToken();
        return await execute(request, method);
      }
      throw GenericException();
    } catch (e) {
      debugPrint('$e');
      throw GenericException();
    }
  }

  Future<dynamic> execute(HttpRequest request, HttpMethod method) async {
    final headers = await getHeaders(request.authType, request.request, request.data ?? '');
    final baseUrl = request.baseUrl ?? this.baseUrl;
    final endPoint = baseUrl + request.endPoint;
    LogUtils.log('AuthType: ${request.authType}');
    LogUtils.log('EndPoint: $endPoint');
    LogUtils.log('Headers: $headers');
    LogUtils.log('Data: ${request.data}');
    LogUtils.log('QueryParams: ${request.queryParams}');
    switch (method) {
      case HttpMethod.get:
        return await dio.get(endPoint, queryParameters: request.queryParams, options: Options(headers: headers));
      case HttpMethod.post:
        return await dio.post(endPoint, data: request.data, options: Options(headers: headers));
      case HttpMethod.put:
        return await dio.put(endPoint, data: request.data, options: Options(headers: headers));
      case HttpMethod.delete:
        return await dio.delete(endPoint, data: request.data, options: Options(headers: headers));
    }
  }

  Future<Map<String, Object>> getHeaders(AuthType? authType, AuthRequest? request, String data) async {
    final headers = <String, Object>{};
    if (authType != null) {
      switch (authType) {
        case AuthType.bearer:
          final accessToken = await authService.getValidAccessToken();
          headers['Authorization'] = 'Bearer $accessToken';
          break;
        case AuthType.basic:
          headers['Authorization'] = 'Basic $basicToken';
          break;
        case AuthType.authBasic:
          headers['Authorization'] = 'Basic ${AuthDto.toBase64(request!)}';
          break;
        case AuthType.none:
          break;
      }
    }
    headers['Content-Type'] = 'application/json';
    headers['Accept'] = 'application/json';
    if (authType != AuthType.none) headers['Api-Key'] = apiKey;
    return headers;
  }
}
