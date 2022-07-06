// To parse this JSON data, do
//
//     final userResponse = userResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class UserResponseDTO {
  UserResponseDTO({
    required this.status,
    required this.data,
    required this.message,
    required this.userMsg,
  });

  int status;
  UserResponseData data;
  String message;
  String userMsg;

  factory UserResponseDTO.fromJson(String str) =>
      UserResponseDTO.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserResponseDTO.fromMap(Map<String, dynamic> json) => UserResponseDTO(
        status: json["status"],
        data: UserResponseData.fromMap(json["data"]),
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

class UserResponseData {
  UserResponseData({
    required this.id,
    required this.roleId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.profilePic,
    required this.countryId,
    required this.gender,
    required this.phoneNo,
    required this.dob,
    required this.isActive,
    required this.created,
    required this.modified,
    required this.accessToken,
  });

  int id;
  int roleId;
  String firstName;
  String lastName;
  String email;
  String username;
  dynamic profilePic;
  dynamic countryId;
  String gender;
  int phoneNo;
  dynamic dob;
  bool isActive;
  String created;
  String modified;
  String accessToken;

  factory UserResponseData.fromJson(String str) =>
      UserResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserResponseData.fromMap(Map<String, dynamic> json) =>
      UserResponseData(
        id: json["id"],
        roleId: json["role_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        username: json["username"],
        profilePic: json["profile_pic"],
        countryId: json["country_id"],
        gender: json["gender"],
        phoneNo: json["phone_no"],
        dob: json["dob"],
        isActive: json["is_active"],
        created: json["created"],
        modified: json["modified"],
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "role_id": roleId,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "username": username,
        "profile_pic": profilePic,
        "country_id": countryId,
        "gender": gender,
        "phone_no": phoneNo,
        "dob": dob,
        "is_active": isActive,
        "created": created,
        "modified": modified,
        "access_token": accessToken,
      };
}
