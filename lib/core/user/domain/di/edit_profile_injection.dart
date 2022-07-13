import 'package:get_it/get_it.dart';
import 'package:neostore/feature/user/controller/edit_profile/edit_profile_bloc.dart';

void inject() {
  final locator = GetIt.instance;

  locator.registerLazySingleton(() => EditProfileBloc());
}
