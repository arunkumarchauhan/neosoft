import 'package:neostore/core/user/data/dto/user_response_dto.dart';
import 'package:neostore/core/user/domain/entity/user_response_entity.dart';

class UserMapper {
  static UserResponseEntity mapUserDTOtoUserEntity(UserResponseDTO dto) =>
      UserResponseEntity.fromMap(dto.toMap());
}
