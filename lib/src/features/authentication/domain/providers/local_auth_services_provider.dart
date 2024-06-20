import 'package:app/src/features/authentication/domain/services/local_auth_services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_auth_services_provider.g.dart';

@riverpod
LocalAuthService localAuthService(LocalAuthServiceRef ref) {
  return LocalAuthService(LocalAuthentication());
}
