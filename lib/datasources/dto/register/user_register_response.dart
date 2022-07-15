import 'package:neostore/datasources/dto/register/user_register_data_dto.dart';

class UserRegisterResponseDto {
  int? status;
  String? message;
  String? usr_msg;
  UserRegisterDataDto? data;
  UserRegisterResponseDto({this.status, this.message, this.data, this.usr_msg});
  factory UserRegisterResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserRegisterResponseToJson(this);
}

UserRegisterResponseDto _$UserRegisterResponseFromJson(
        Map<String, dynamic> json) =>
    UserRegisterResponseDto(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UserRegisterDataDto.fromJson(json['data'] as Map<String, dynamic>),
      usr_msg: json['usr_msg'] as String?,
    );

Map<String, dynamic> _$UserRegisterResponseToJson(
        UserRegisterResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'usr_msg': instance.usr_msg,
      'data': instance.data,
    };
