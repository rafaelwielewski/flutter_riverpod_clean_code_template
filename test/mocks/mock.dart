import 'package:app/src/shared/domain/repository/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mocktail/mocktail.dart';

import 'test_router.dart';

void main() async {
  await dotenv.load(fileName: ".env");
}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

class MockDio extends Mock implements Dio {}

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

class MockAppRouter extends Mock implements TestRouter {}

class MockUserRepository extends Mock implements UserRepository {}
