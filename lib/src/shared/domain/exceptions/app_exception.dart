sealed class AppException implements Exception {
  AppException(this.title, this.message);
  final String title;
  final String message;

  @override
  String toString() => 'AppException: $title - $message';
}

class HttpException extends AppException {
  HttpException({required String title, required String message}) : super(title, message);
}

class GenericException extends AppException {
  GenericException()
      : super(
          'Oops, algo deu errado',
          'Por favor, tente novamente mais tarde.',
        );
}

class SessionExpiredException extends AppException {
  SessionExpiredException()
      : super(
          'Sessão expirada',
          'Sua sessão expirou, por favor faça login novamente.',
        );
}

class ExpectedException extends AppException {
  ExpectedException({required String title, required String message}) : super(title, message);
}
