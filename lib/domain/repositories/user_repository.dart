import 'package:either_dart/either.dart';
import 'package:neostore/domain/entity/user/user_entity.dart';
import 'package:neostore/domain/repositories/user_login_cred_entity.dart';
import 'package:neostore/domain/entity/user/user_response_entity.dart';
import 'package:neostore/utils/models/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, UserDataEntity>> registerUser(UserEntity userEntity);
  Future<Either<Failure, UserDataEntity>> loginUser(
      UserLoginCredEntity userLoginCredEntity);
}
