import 'package:either_dart/either.dart';
import 'package:either_dart/src/either.dart';
import 'package:neostore/core/user/data/datasource/user_remote_data_source.dart';
import 'package:neostore/core/user/data/mapper/user_mapper.dart';
import 'package:neostore/core/user/data/repositories/user_repository.dart';
import 'package:neostore/core/user/domain/entity/user_entity.dart';
import 'package:neostore/core/user/domain/entity/user_response_entity.dart';
import 'package:neostore/utils/models/failure.dart';
//
// class UserRepoImplementation extends UserRepository {
//   UserRepoImplementation({required UserRemoteDatSource remoteDatSource})
//       : _remoteDatSource = remoteDatSource;
//   late UserRemoteDatSource _remoteDatSource;
//   @override
//   Future<Either<Failure, UserDataEntity>> registerUser(
//       UserEntity userEntity) async {
//     final response = await _remoteDatSource.registerUser(userEntity);
//     if (response.isLeft) return Left(response.left);
//     return Right(UserDataEntity.fromMap(response.right.toMap()));
//     // return Right(UserMapper.mapUserDTOtoUserEntity(response.right));
//   }
// }
