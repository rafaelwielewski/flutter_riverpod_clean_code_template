import 'dart:async';
import 'package:app/src/shared/data/dto/user_dto.dart';
import 'package:app/src/shared/data/datasource/remote/http_request.dart';
import 'package:app/src/shared/data/datasource/remote/http_service.dart';
import 'package:app/src/shared/domain/models/user.dart';
import 'package:app/src/shared/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final HttpService httpClient;

  UserRepositoryImpl(this.httpClient);

  @override
  Future<User> getUser() async {
    final response = await httpClient.get(
      HttpRequest('/me'),
    );
    return UserDto.fromJson(response);
  }
}
