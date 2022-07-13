import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:neostore/core/user/data/datasource/user_api_service.dart';
import 'package:neostore/core/user/domain/repository/user_repository_retro_implementation.dart';
import 'package:neostore/feature/user/controller/login_controller/login_bloc.dart';

void inject() {
  final locator = GetIt.instance;
  locator.registerLazySingleton(() => UserApiService(Dio()));
  locator.registerLazySingleton(() =>
      UserRepoRetroImplementation(remoteDatSource: locator<UserApiService>()));
  locator.registerLazySingleton(() => LoginBloc(
      userRepoImplementation: locator<UserRepoRetroImplementation>()));
}
