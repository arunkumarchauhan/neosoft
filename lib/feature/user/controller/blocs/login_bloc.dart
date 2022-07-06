import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neostore/core/user/domain/repository/user_repository_implementation.dart';
import 'package:neostore/core/user/domain/repository/user_repository_retro_implementation.dart';
import 'package:neostore/feature/user/controller/events/login_event.dart';
import 'package:neostore/feature/user/controller/states/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late UserRepoRetroImplementation _userRepoImplementation;
  LoginBloc({required UserRepoRetroImplementation userRepoImplementation})
      : _userRepoImplementation = userRepoImplementation,
        super(LoginInitialState()) {
    on<InitiateLoginEvent>((event, emit) async {
      // emit(LoginSuccessState(either:await _userRepoImplementation.registerUser(userEntity) ));
    });
  }
}
