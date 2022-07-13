import 'dart:convert';

class ResetPasswordBodyEntity {
  ResetPasswordBodyEntity({
    this.oldPassword,
    this.password,
    this.confirmPassword,
  });

  @override
  String toString() {
    return 'ResetPasswordBodyEntity{oldPassword: $oldPassword, password: $password, confirmPassword: $confirmPassword}';
  }

  String? oldPassword;
  String? password;
  String? confirmPassword;

  factory ResetPasswordBodyEntity.fromJson(String str) =>
      ResetPasswordBodyEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResetPasswordBodyEntity.fromMap(Map<String, dynamic> json) =>
      ResetPasswordBodyEntity(
        oldPassword: json["old_password"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
      );

  Map<String, dynamic> toMap() => {
        "old_password": oldPassword,
        "password": password,
        "confirm_password": confirmPassword,
      };
}
