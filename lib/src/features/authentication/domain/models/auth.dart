class Auth {
  final String login;
  final bool isLoggedIn;
  final bool isBioAvailable;
  final bool isBioActivated;
  final bool isBioAuthRequested;
  final bool isBioLoginAvailable;

  Auth({
    required this.login,
    required this.isLoggedIn,
    required this.isBioAvailable,
    required this.isBioActivated,
    required this.isBioAuthRequested,
    required this.isBioLoginAvailable,
  });

  factory Auth.initial() {
    return Auth(
      login: '',
      isLoggedIn: false,
      isBioAvailable: false,
      isBioActivated: false,
      isBioAuthRequested: false,
      isBioLoginAvailable: false,
    );
  }

  Auth copyWith({
    String? login,
    bool? isLoggedIn,
    bool? isAccessTokenStored,
    bool? isRefreshTokenStored,
    bool? isBioAvailable,
    bool? isBioActivated,
    bool? isBioAuthRequested,
    bool? isBioLoginAvailable,
  }) {
    return Auth(
      login: login ?? this.login,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isBioAvailable: isBioAvailable ?? this.isBioAvailable,
      isBioActivated: isBioActivated ?? this.isBioActivated,
      isBioAuthRequested: isBioAuthRequested ?? this.isBioAuthRequested,
      isBioLoginAvailable: isBioLoginAvailable ?? this.isBioLoginAvailable,
    );
  }
}

class AuthResponse {
  final String accessToken;
  final String refreshToken;

  AuthResponse({required this.accessToken, required this.refreshToken});
}

class AuthRequest {
  final String email;
  final String password;

  AuthRequest({
    required this.email,
    required this.password,
  });
}
