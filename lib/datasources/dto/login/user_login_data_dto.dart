import 'dart:convert';

class UserLoginDataDto {
  UserLoginDataDto({
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

  factory UserLoginDataDto.fromJson(String str) =>
      UserLoginDataDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserLoginDataDto.fromMap(Map<String, dynamic> json) =>
      UserLoginDataDto(
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
