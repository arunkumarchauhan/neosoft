class UserLoginCredEntity {
  UserLoginCredEntity({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  factory UserLoginCredEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginCredEntity(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
