import 'package:jwt_decoder/jwt_decoder.dart';

class JwtUtils {
  static bool isTokenValid(String token) {
    try {
      final Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

      final int expirationTime = decodedToken['exp'];
      final int currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      return expirationTime > currentTime;
    } catch (e) {
      return false;
    }
  }
}
