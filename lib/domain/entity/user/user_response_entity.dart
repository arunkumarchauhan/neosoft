import 'dart:convert';

class UserResponseEntity {
  UserResponseEntity({
    required this.data,
    required this.message,
    required this.userMsg,
  });

  UserDataEntity data;
  String message;
  String userMsg;

  factory UserResponseEntity.fromJson(String str) =>
      UserResponseEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserResponseEntity.fromMap(Map<String, dynamic> json) =>
      UserResponseEntity(
        data: UserDataEntity.fromMap(json["data"]),
        message: json["message"],
        userMsg: json["user_msg"],
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
        "message": message,
        "user_msg": userMsg,
      };
}

class UserDataEntity {
  UserDataEntity({
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
  String accessToken;

  factory UserDataEntity.fromJson(String str) =>
      UserDataEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDataEntity.fromMap(Map<String, dynamic> json) => UserDataEntity(
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
        "access_token": accessToken,
      };
}
