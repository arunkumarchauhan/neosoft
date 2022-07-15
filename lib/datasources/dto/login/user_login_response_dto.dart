import 'dart:convert';

import 'package:neostore/datasources/dto/login/user_login_data_dto.dart';

class UserLoginResponseDTO {
  UserLoginResponseDTO({
    required this.status,
    required this.data,
    required this.message,
    required this.userMsg,
  });

  int status;
  UserLoginDataDto data;
  String message;
  String userMsg;

  factory UserLoginResponseDTO.fromJson(String str) =>
      UserLoginResponseDTO.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserLoginResponseDTO.fromMap(Map<String, dynamic> json) =>
      UserLoginResponseDTO(
        status: json["status"],
        data: UserLoginDataDto.fromMap(json["data"]),
        message: json["message"],
        userMsg: json["user_msg"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data.toMap(),
        "message": message,
        "user_msg": userMsg,
      };
}
