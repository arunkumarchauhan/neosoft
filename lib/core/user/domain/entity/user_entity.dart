// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

class UserEntity {
  UserEntity({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.confirmPassword,
    this.gender,
    this.phoneNo,
    this.acceptedTerms,
  });

  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? confirmPassword;
  String? gender;
  String? phoneNo;
  bool? acceptedTerms;
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
        acceptedTerms: json["accepted_terms"],
      );

  Map<String, dynamic> toMap() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
        "gender": gender,
        "phone_no": int.tryParse(phoneNo ?? "0"),
        "accepted_terms": acceptedTerms ?? false
      };

  @override
  String toString() {
    return 'UserEntity{ firstName: $firstName, lastName: $lastName, email: $email, password: $password, confirmPassword: $confirmPassword, gender: $gender, phoneNo: $phoneNo, acceptedTerms: $acceptedTerms}';
  }
}
