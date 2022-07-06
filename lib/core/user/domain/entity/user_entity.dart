// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

class UserEntity {
  UserEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.gender,
    required this.phoneNo,
  });

  String firstName;
  String lastName;
  String email;
  String password;
  String confirmPassword;
  String gender;
  int phoneNo;

  factory UserEntity.fromJson(String str) =>
      UserEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserEntity.fromMap(Map<String, dynamic> json) => UserEntity(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
        gender: json["gender"],
        phoneNo: json["phone_no"],
      );

  Map<String, dynamic> toMap() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
        "gender": gender,
        "phone_no": phoneNo,
      };
}
