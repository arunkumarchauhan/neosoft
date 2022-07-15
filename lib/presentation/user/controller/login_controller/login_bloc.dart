import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neostore/data/repositories/user_repository_implementation.dart';
import 'package:neostore/presentation/user/controller/login_controller/login_event.dart';
import 'package:neostore/presentation/user/controller/login_controller/login_state.dart';
import 'package:neostore/utils/extensions/email_validator.dart';
import 'package:neostore/presentation/user/model/user_login_cred_error_model.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late UserRepoRetroImplementation _userRepoImplementation;

  LoginBloc({required UserRepoRetroImplementation userRepoImplementation})
      : _userRepoImplementation = userRepoImplementation,
        super(LoginInitialState()) {
    on<InitiateLoginEvent>((event, emit) async {
      // emit(LoginSuccessState(either:await _userRepoImplementation.registerUser(userEntity) ));
    });
    on<LoginInputChangeEvent>((event, emit) {
      emit(ValidatingLoginInputState());
      UserLoginCredError userLoginCredError = UserLoginCredError();
      if (!event.userLoginCred.email.isValidEmail()) {
        userLoginCredError.userNameError = "Invalid Email";
        emit(InvalidLoginInputState(userLoginCredError: userLoginCredError));
      } else if (event.userLoginCred.password == null ||
          event.userLoginCred.password.isEmpty) {
        userLoginCredError.userPasswordError = "Invalid Password";
        emit(InvalidLoginInputState(userLoginCredError: userLoginCredError));
      } else {
        emit(ValidLoginInputState(userLoginCredError: userLoginCredError));
      }
    });
  }
}
