import 'package:neostore/core/user/data/dto/login_dto.dart';
import 'package:neostore/core/user/data/dto/register_dto.dart';
import 'package:neostore/core/user/data/dto/user_response_dto.dart';
import 'package:neostore/core/user/domain/entity/user_entity.dart';
import 'package:neostore/core/user/domain/entity/user_login_cred_entity.dart';
import 'package:neostore/core/user/domain/entity/user_response_entity.dart';

class UserMapper {
  static UserResponseEntity mapUserDTOtoUserEntity(UserResponseDTO dto) =>
      UserResponseEntity.fromMap(dto.toMap());

  static RegisterDTO mapUserEntityToRegisterDTO(UserEntity entity) =>
      RegisterDTO.fromJson(entity.toMap());

  static UserEntity mapRegisterDTOToUserEntity(RegisterDTO dto) =>
      UserEntity.fromMap(dto.toJson());
  static LoginDTO mapUserLoginCredEntityToLoginDTO(
          UserLoginCredEntity entity) =>
      LoginDTO.fromJson(entity.toJson());
}
