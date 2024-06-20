import 'package:app/src/features/authentication/domain/models/auth.dart';
import 'package:app/src/shared/data/datasource/remote/http_service.dart';

class HttpRequest {
  final String endPoint;
  final AuthType authType;
  final AuthRequest? request;
  final String? data;
  final Map<String, dynamic>? queryParams;
  final String? baseUrl;

  HttpRequest(
    this.endPoint, {
    this.authType = AuthType.bearer,
    this.request,
    this.data,
    this.queryParams,
    this.baseUrl,
  });
}
