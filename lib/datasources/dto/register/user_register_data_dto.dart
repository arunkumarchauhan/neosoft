class UserRegisterDataDto {
  UserRegisterDataDto({
    this.id,
    this.roleId,
    this.firstName,
    this.lastName,
    this.email,
    this.username,
    this.profilePic,
    this.countryId,
    this.gender,
    this.phoneNo,
    this.dob,
    this.isActive,
    this.created,
    this.modified,
    this.accessToken,
  });

  int? id;
  int? roleId;
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  String? profilePic;
  String? countryId;
  String? gender;
  int? phoneNo;
  dynamic dob;
  bool? isActive;
  String? created;
  String? modified;
  String? accessToken;
  factory UserRegisterDataDto.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

UserRegisterDataDto _$UserFromJson(Map<String, dynamic> json) =>
    UserRegisterDataDto(
      id: json['id'] as int?,
      roleId: json['roleId'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      profilePic: json['profilePic'] as String?,
      countryId: json['countryId'] as String?,
      gender: json['gender'] as String?,
      phoneNo: json['phoneNo'] as int?,
      dob: json['dob'],
      isActive: json['isActive'] as bool?,
      created: json['created'] as String?,
      modified: json['modified'] as String?,
      accessToken: json['accessToken'] as String?,
    );

Map<String, dynamic> _$UserToJson(UserRegisterDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roleId': instance.roleId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'username': instance.username,
      'profilePic': instance.profilePic,
      'countryId': instance.countryId,
      'gender': instance.gender,
      'phoneNo': instance.phoneNo,
      'dob': instance.dob,
      'isActive': instance.isActive,
      'created': instance.created,
      'modified': instance.modified,
      'accessToken': instance.accessToken,
    };
