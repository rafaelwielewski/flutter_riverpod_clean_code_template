import 'package:app/src/shared/domain/models/user.dart';

class UserDto {
  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(),
      name: json['fullName'].toString().trim(),
      firstName: json['fullName'].toString().trim().split(' ')[0].trim(),
      email: json['email'],
    );
  }
}
