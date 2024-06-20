import 'package:app/src/features/authentication/domain/models/auth.dart';
import 'package:app/src/features/authentication/domain/repository/auth_repository.dart';
import 'package:app/src/features/authentication/domain/repository/local_auth_repository.dart';
import 'package:app/src/features/authentication/domain/services/local_auth_services.dart';
import 'package:app/src/routing/app_router.dart';
import 'package:app/src/routing/app_router.gr.dart';
import 'package:app/src/shared/domain/exceptions/app_exception.dart';
import 'package:app/src/features/authentication/presentation/provider/auth_state_provider.dart';
import 'package:app/src/utils/jwt_utils.dart';

class AuthService {
  final AuthRepository authRepository;
  final LocalAuthRepository localAuthRepository;
  final LocalAuthService localAuthService;
  final AuthState authState;
  bool isRefreshingToken = false;

  AuthService(this.authRepository, this.localAuthRepository, this.localAuthService, this.authState);

  Future<String?> getValidAccessToken() async {
    String token = await localAuthRepository.getAccessToken();
    if (token.isNotEmpty) {
      if (JwtUtils.isTokenValid(token)) {
        return token;
      } else {
        if (!isRefreshingToken) {
          isRefreshingToken = true;
          String? refreshToken = await localAuthRepository.getRefreshToken();
          final authResponse = await authRepository.refreshToken(refreshToken);
          await localAuthRepository.setTokens(authResponse);
          isRefreshingToken = false;
          return authResponse.accessToken;
        } else {
          await _waitForTokenRefresh();
          return await getValidAccessToken();
        }
      }
    }
    return null;
  }

  Future<String> refreshAccessToken() async {
    String? token = await localAuthRepository.getRefreshToken();
    try {
      final authResponse = await authRepository.refreshToken(token);
      await localAuthRepository.setTokens(authResponse);
      return authResponse.accessToken;
    } catch (e) {
      await logout();
      await Future.delayed(const Duration(milliseconds: 500));
      isRefreshingToken = false;
      throw HttpException(
        title: 'Sessão expirada',
        message: 'Sua sessão expirou, por favor faça login novamente.',
      );
    }
  }

  Future<void> login(AuthRequest authRequest) async {
    try {
      final authResponse = await authRepository.signIn(authRequest);
      await localAuthRepository.setTokens(authResponse);
      await localAuthRepository.setLogin(authRequest.email);
      authState.updateIsLoggedIn(true);
      if (authState.getAuthState().isBioActivated) authState.updateIsBioLoginAvailable(true);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> loginBio() async {
    try {
      final authorized = await localAuthService.authorize();
      if (!authorized) return false;
      final accessToken = await localAuthRepository.getAccessToken();
      final refreshToken = await localAuthRepository.getRefreshToken();
      final isAccessTokenValid = JwtUtils.isTokenValid(accessToken);
      final isRefreshTokenValid = JwtUtils.isTokenValid(refreshToken);

      if (!isRefreshTokenValid) {
        await logout();
        await Future.delayed(const Duration(milliseconds: 500));
        isRefreshingToken = false;
        throw HttpException(
          title: 'Sessão expirada',
          message: 'Sua sessão expirou, por favor faça login novamente.',
        );
      }

      if (!isAccessTokenValid) {
        await refreshAccessToken();
      } else {
        refreshAccessToken();
      }
      authState.updateIsLoggedIn(true);

      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> activateBio() async {
    if (!authState.getAuthState().isBioAvailable) return false;
    await localAuthRepository.setBio(true, true);
    authState.updateIsBioAuthRequested(true);
    authState.updateIsBioActivated(true);
    return true;
  }

  Future<bool> deactivateBio() async {
    final authorized = await localAuthService.authorize();
    if (authorized) {
      await localAuthRepository.setBio(false, true);
      authState.updateIsBioActivated(false);
      authState.updateIsBioLoginAvailable(false);
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    await localAuthRepository.logout();
    authState.clearAll();
    await localAuthRepository.getInitialAuth();
    await appRouter.replaceAll([const HomeRoute()], updateExistingRoutes: false);
  }

  Future<void> _waitForTokenRefresh() async {
    while (isRefreshingToken) {
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }
}
