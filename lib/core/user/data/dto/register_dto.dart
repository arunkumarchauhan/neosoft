// To parse this JSON data, do
//
//     final registerDto = registerDtoFromMap(jsonString);
import 'package:json_annotation/json_annotation.dart';
part 'register_dto.g.dart';

@JsonSerializable()
class RegisterDTO {
  RegisterDTO({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.confirmPassword,
    this.gender,
    this.phoneNo,
  });

  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? confirmPassword;
  String? gender;
  int? phoneNo;

  factory RegisterDTO.fromJson(Map<String, dynamic> json) =>
      _$RegisterDTOFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterDTOToJson(this);
}
