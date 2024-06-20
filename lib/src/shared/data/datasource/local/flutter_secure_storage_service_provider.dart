import 'package:app/src/shared/data/datasource/local/flutter_secure_storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flutter_secure_storage_service_provider.g.dart';

@Riverpod(keepAlive: true)
FlutterSecureStorageService flutterSecureStorageService(FlutterSecureStorageServiceRef ref) {
  return FlutterSecureStorageService();
}
