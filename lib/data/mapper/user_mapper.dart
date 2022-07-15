import 'package:neostore/datasources/dto/login/login_dto.dart';
import 'package:neostore/datasources/dto/login/user_login_response_dto.dart';
import 'package:neostore/datasources/dto/register/register_dto.dart';
import 'package:neostore/domain/entity/user/user_entity.dart';
import 'package:neostore/domain/repositories/user_login_cred_entity.dart';
import 'package:neostore/domain/entity/user/user_response_entity.dart';

class UserMapper {
  static UserResponseEntity mapUserDTOtoUserEntity(UserLoginResponseDTO dto) =>
      UserResponseEntity.fromMap(dto.toMap());

  static RegisterDTO mapUserEntityToRegisterDTO(UserEntity entity) =>
      RegisterDTO.fromJson(entity.toMap());

  static UserEntity mapRegisterDTOToUserEntity(RegisterDTO dto) =>
      UserEntity.fromMap(dto.toJson());
  static LoginDTO mapUserLoginCredEntityToLoginDTO(
          UserLoginCredEntity entity) =>
      LoginDTO.fromJson(entity.toJson());
}

extension RegisterMapper on UserEntity {
  RegisterDTO mapToDto() {
    return RegisterDTO.fromJson(toMap());
  }
}
