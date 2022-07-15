import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neostore/domain/entity/user/reset_password_body_entity.dart';
import 'package:neostore/presentation/user/controller/reset_password/reset_password_event.dart';
import 'package:neostore/presentation/user/controller/reset_password/reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(InitializeResetPasswordState()) {
    on<InputChangeResetPasswordEvent>((event, emit) {
      emit(ValidatingInputResetPasswordState());
      final errorBody = ResetPasswordBodyEntity();
      final body = event.passwordBodyEntity;
      if (body.oldPassword == null || body.oldPassword!.isEmpty) {
        errorBody.oldPassword = "Invalid Password";
        emit(InvalidInputResetPasswordState(passwordBodyEntity: errorBody));
      } else if (body.password == null || body.password!.isEmpty) {
        errorBody.password = "Invalid Password";
        emit(InvalidInputResetPasswordState(passwordBodyEntity: errorBody));
      } else if (body.confirmPassword == null ||
          body.confirmPassword!.isEmpty) {
        errorBody.confirmPassword = "Invalid Password";
        emit(InvalidInputResetPasswordState(passwordBodyEntity: errorBody));
      } else if (body.confirmPassword != body.password) {
        errorBody.confirmPassword = errorBody.password =
            "Confirm Password and New passwords do not match.";
        emit(InvalidInputResetPasswordState(passwordBodyEntity: errorBody));
      } else {
        emit(ValidInputResetPasswordState(passwordBodyEntity: errorBody));
      }
    });
  }
}
