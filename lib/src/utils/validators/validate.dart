import 'package:app/src/utils/validators/validator_email.dart';
import 'package:app/src/utils/validators/validator_range.dart';

class Validate {
  static bool empty(String? value) {
    return RangeValidator.isValid(value, 1, 200, clearNonNumber: false);
  }

  static bool email(String? email, [bool allowTopLevelDomains = false, bool allowInternational = true]) {
    return EmailValidator.isValid(email, allowTopLevelDomains, allowInternational);
  }

  static bool password(String? password) {
    return RangeValidator.isValid(password, 1, 100, clearNonNumber: false);
  }

  static bool newPassword(String? password) {
    return RangeValidator.isValid(password, 6, 100, clearNonNumber: false);
  }
}
