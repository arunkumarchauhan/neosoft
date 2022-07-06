import 'package:json_annotation/json_annotation.dart';
import 'package:neostore/core/user/data/dto/user.dart';
part 'user_register_response.g.dart';

@JsonSerializable()
class UserRegisterResponse {
  int? status;
  String? message;
  String? usr_msg;
  User? data;
  UserRegisterResponse({this.status, this.message, this.data, this.usr_msg});
  factory UserRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserRegisterResponseToJson(this);
}
