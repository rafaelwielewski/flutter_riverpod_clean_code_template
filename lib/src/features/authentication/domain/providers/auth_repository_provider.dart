import 'package:app/src/features/authentication/data/repository/fake_auth_repository.dart';
import 'package:app/src/features/authentication/domain/repository/auth_repository.dart';
import 'package:app/src/shared/data/datasource/local/flutter_secure_storage_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_provider.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  //final auth = AuthRepositoryImpl(ref.watch(httpServiceProvider, ref.watch(flutterSecureStorageServiceProvider)));
  final auth = FakeAuthRepository(ref.watch(flutterSecureStorageServiceProvider));
  return auth;
}
