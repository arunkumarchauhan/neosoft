import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neostore/feature/user/controller/forgot_password/forgot_password_event.dart';
import 'package:neostore/feature/user/controller/forgot_password/forgot_password_state.dart';
import 'package:neostore/utils/extensions/email_validator.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(InvalidInputForgotPasswordState()) {
    on<InputChangeForgotPasswordEvent>((event, emit) {
      emit(ValidatingInputForgotPasswordState());
      if (!event.email.isValidEmail()) {
        emit(InvalidInputForgotPasswordState(error: "Invalid Email"));
      } else {
        emit(ValidInputForgotPasswordState());
      }
    });
  }
}
