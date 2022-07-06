// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
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

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
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
