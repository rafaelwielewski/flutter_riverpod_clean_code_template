import 'package:app/src/utils/validators/validate.dart';

class ValidateInput {
  static String? email(String? email, [bool allowTopLevelDomains = false, bool allowInternational = true]) {
    return !Validate.email(email, allowTopLevelDomains, allowInternational) ? 'Por favor, digite um e-mail válido.' : null;
  }

  static String? password(String? password) {
    return !Validate.password(password) ? 'Por favor, digite uma senha' : null;
  }
}
