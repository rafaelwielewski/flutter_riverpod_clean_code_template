import 'package:app/src/shared/domain/exceptions/error_logger.dart';
import 'package:app/src/utils/bio_messages.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_auth_services.g.dart';

@riverpod
LocalAuthService localAuthService(LocalAuthServiceRef ref) {
  return LocalAuthService(LocalAuthentication());
}

class LocalAuthService {
  final LocalAuthentication auth;

  LocalAuthService(this.auth);

  Future<bool> authorize() async {
    bool authenticated = false;
    try {
      await auth.stopAuthentication();
      authenticated = await auth.authenticate(
          localizedReason: 'Desbloqueie seu celular',
          options: const AuthenticationOptions(
            stickyAuth: true,
          ),
          authMessages: <AuthMessages>[androidAuthMessages, iosAuthMessages]);
    } on PlatformException catch (e, stackTrace) {
      ErrorLogger().logError(e, stackTrace);
      throw Exception();
    }
    return authenticated;
  }
}
