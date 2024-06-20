import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

const IOSAuthMessages iosAuthMessages = IOSAuthMessages(
  cancelButton: 'Cancelar',
  goToSettingsButton: 'Ir para Configurações',
  goToSettingsDescription: 'Configurações',
  lockOut: 'Acesso bloqueado por várias tentativas.',
  localizedFallbackTitle: 'Autenticação por senha',
);

final AndroidAuthMessages androidAuthMessages = AndroidAuthMessages(
  cancelButton: 'Cancelar',
  biometricRequiredTitle: '${dotenv.env['APP_NAME']} - Acesso',
  deviceCredentialsRequiredTitle: '${dotenv.env['APP_NAME']} - Acesso',
  deviceCredentialsSetupDescription: 'Configurações',
  biometricHint: 'Acesso por senha do dispositivo',
  biometricSuccess: 'Acesso permitido.',
  biometricNotRecognized: 'Acesso negado.',
  goToSettingsButton: 'Configurações',
  goToSettingsDescription: 'Configurações',
  signInTitle: dotenv.env['APP_NAME'],
);
