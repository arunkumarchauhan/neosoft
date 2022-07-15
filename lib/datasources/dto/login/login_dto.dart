class LoginDTO {
  String email;
  String password;
  LoginDTO({required this.email, required this.password});
  factory LoginDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginDTOFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDTOToJson(this);
}

LoginDTO _$LoginDTOFromJson(Map<String, dynamic> json) => LoginDTO(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginDTOToJson(LoginDTO instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
