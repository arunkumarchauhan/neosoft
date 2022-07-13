import 'dart:convert';

class EditProfileBodyEntity {
  EditProfileBodyEntity({
    this.firstName,
    this.lastName,
    this.email,
    this.dob,
    this.profilePic,
    this.phoneNo,
  });

  @override
  String toString() {
    return 'EditProfileBodyEntity{firstName: $firstName, lastName: $lastName, email: $email, dob: $dob, profilePic: $profilePic, phoneNo: $phoneNo}';
  }

  String? firstName;
  String? lastName;
  String? email;
  String? dob;
  String? profilePic;
  String? phoneNo;

  factory EditProfileBodyEntity.fromJson(String str) =>
      EditProfileBodyEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EditProfileBodyEntity.fromMap(Map<String, dynamic> json) =>
      EditProfileBodyEntity(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        dob: json["dob"],
        profilePic: json["profile_pic"],
        phoneNo: json["phone_no"],
      );

  Map<String, dynamic> toMap() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "dob": dob,
        "profile_pic": profilePic,
        "phone_no": int.tryParse(phoneNo ?? "0"),
      };
}
