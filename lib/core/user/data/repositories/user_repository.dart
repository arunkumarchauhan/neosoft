import 'package:either_dart/either.dart';
import 'package:neostore/core/user/domain/entity/user_entity.dart';
import 'package:neostore/core/user/domain/entity/user_login_cred_entity.dart';
import 'package:neostore/core/user/domain/entity/user_response_entity.dart';
import 'package:neostore/utils/models/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, UserDataEntity>> registerUser(UserEntity userEntity);
  Future<Either<Failure, UserDataEntity>> loginUser(
      UserLoginCredEntity userLoginCredEntity);
}
