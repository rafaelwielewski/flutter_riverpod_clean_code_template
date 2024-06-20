import 'package:app/src/shared/data/datasource/local/flutter_secure_storage_service_provider.dart';
import 'package:app/src/shared/data/repository/local_user_repository_impl.dart';
import 'package:app/src/shared/domain/repository/local_user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_user_repository_provider.g.dart';

@Riverpod(keepAlive: true)
LocalUserRepository localUserRepository(LocalUserRepositoryRef ref) {
  return LocalUserRepositoryImpl(ref.watch(flutterSecureStorageServiceProvider));
}
