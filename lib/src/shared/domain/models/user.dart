class User {
  final String id;
  final String name;
  final String firstName;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.firstName,
    required this.email,
  });

  factory User.initial() {
    return User(
      id: '',
      name: '',
      firstName: '',
      email: '',
    );
  }

  User copyWith({
    String? id,
    String? name,
    String? firstName,
    String? email,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      firstName: firstName ?? this.firstName,
      email: email ?? this.email,
    );
  }
}
