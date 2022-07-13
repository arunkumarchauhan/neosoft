import 'package:get_it/get_it.dart';
import 'package:neostore/feature/user/controller/user_register_controller/user_register_bloc.dart';

void inject() {
  final locator = GetIt.instance;

  locator.registerLazySingleton(() => UserRegistrationBloc());
}
