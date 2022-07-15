import 'package:either_dart/either.dart';
import 'package:either_dart/src/either.dart';
import 'package:flutter/material.dart';
import 'package:neostore/datasources/remote/implementation/user_api_service.dart';
import 'package:neostore/data/mapper/user_mapper.dart';
import 'package:neostore/domain/repositories/user_repository.dart';
import 'package:neostore/domain/entity/user/user_entity.dart';
import 'package:neostore/domain/repositories/user_login_cred_entity.dart';
import 'package:neostore/domain/entity/user/user_response_entity.dart';
import 'package:neostore/utils/models/failure.dart';

class UserRepoRetroImplementation implements UserRepository {
  UserRepoRetroImplementation({required UserApiService remoteDatSource})
      : _remoteDatSource = remoteDatSource;
  late UserApiService _remoteDatSource;
  @override
  Future<Either<Failure, UserDataEntity>> registerUser(
      UserEntity userEntity) async {
    try {
      final response = await _remoteDatSource
          .register(UserMapper.mapUserEntityToRegisterDTO(userEntity));
      if (response.status == 200) {
        return Right(UserDataEntity.fromMap(response.toJson()));
      } else {
        return Left(Failure("${response.usr_msg}"));
      }
    } catch (e) {
      debugPrint(e.toString());
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserDataEntity>> loginUser(
      UserLoginCredEntity userLoginCredEntity) async {
    try {
      final response = await _remoteDatSource.login(
          UserMapper.mapUserLoginCredEntityToLoginDTO(userLoginCredEntity));
      if (response.status == 200) {
        return Right(UserDataEntity.fromMap(response.toJson()));
      } else {
        return Left(Failure("${response.usr_msg}"));
      }
    } catch (e) {
      debugPrint(e.toString());
      return Left(Failure(e.toString()));
    }
  }
}
