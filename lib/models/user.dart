import 'package:meta/meta.dart';

class User {
  String id;
  String email;
  String username;
  String jwt;

  User({
    @required this.id,
    @required this.email,
    @required this.username,
    @required this.jwt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        email: json['email'],
        username: json['username'],
        jwt: json['jwt'],
      );
}
