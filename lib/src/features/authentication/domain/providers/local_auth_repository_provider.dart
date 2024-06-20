import 'package:app/src/features/authentication/data/repository/local_auth_repository_impl.dart';
import 'package:app/src/features/authentication/domain/repository/local_auth_repository.dart';
import 'package:app/src/shared/data/datasource/local/flutter_secure_storage_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_auth_repository_provider.g.dart';

@riverpod
LocalAuthRepository localAuthRepository(LocalAuthRepositoryRef ref) {
  return LocalAuthRepositoryImpl(ref.watch(flutterSecureStorageServiceProvider));
}
