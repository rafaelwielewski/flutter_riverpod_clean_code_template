import 'package:app/src/features/authentication/domain/providers/auth_repository_provider.dart';
import 'package:app/src/features/authentication/domain/providers/local_auth_repository_provider.dart';
import 'package:app/src/features/authentication/domain/services/auth_services.dart';
import 'package:app/src/shared/data/datasource/remote/dio_http_service.dart';
import 'package:app/src/features/authentication/domain/services/local_auth_services.dart';
import 'package:app/src/features/authentication/presentation/provider/auth_state_provider.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_services_provider.g.dart';

@riverpod
AuthService authService(AuthServiceRef ref) {
  final httpService = ref.watch(httpServiceProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  final localAuthRepository = ref.watch(localAuthRepositoryProvider);
  final localAuthService = ref.watch(localAuthServiceProvider);
  final authState = ref.watch(authStateProvider.notifier);
  AuthService authService = AuthService(authRepository, localAuthRepository, localAuthService, authState);
  httpService.setAuthService(authService);
  return authService;
}
