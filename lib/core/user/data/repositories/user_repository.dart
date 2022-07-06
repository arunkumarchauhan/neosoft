import 'package:either_dart/either.dart';
import 'package:neostore/core/user/domain/entity/user_entity.dart';
import 'package:neostore/core/user/domain/entity/user_response_entity.dart';
import 'package:neostore/utils/models/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, UserResponseEntity>> registerUser(
      UserEntity userEntity);
}
