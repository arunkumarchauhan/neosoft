import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neostore/domain/entity/user/user_entity.dart';
import 'package:neostore/presentation/user/controller/user_register_controller/user_register_events.dart';
import 'package:neostore/presentation/user/controller/user_register_controller/user_register_states.dart';
import 'package:neostore/utils/extensions/email_validator.dart';
import 'package:neostore/utils/extensions/phone_validator.dart';

class UserRegistrationBloc extends Bloc<UserRegisterEvent, UserRegisterState> {
  UserRegistrationBloc() : super(InitializeUserRegisterState()) {
    on<RegisterInputChangeEvent>((event, emit) {
      UserEntity userRegisterError = UserEntity();
      emit(ValidatingRegisterInputState());
      if (event.user.firstName == null || event.user.firstName!.isEmpty) {
        print(event.user.firstName);
        userRegisterError.firstName = "Invalid First Name";
        emit(InvalidUserRegisterInputState(
            userRegisterError: userRegisterError));
      } else if (event.user.lastName == null || event.user.lastName!.isEmpty) {
        userRegisterError.lastName = "Invalid Last Name";
        emit(InvalidUserRegisterInputState(
            userRegisterError: userRegisterError));
      } else if (!event.user.email!.isValidEmail()) {
        userRegisterError.email = "Invalid Email";
        emit(InvalidUserRegisterInputState(
            userRegisterError: userRegisterError));
      } else if (event.user.password == null || event.user.password!.isEmpty) {
        userRegisterError.password = "Invalid Password";
        emit(InvalidUserRegisterInputState(
            userRegisterError: userRegisterError));
      } else if (event.user.confirmPassword == null ||
          event.user.confirmPassword!.isEmpty) {
        userRegisterError.confirmPassword = "Invalid Confirm Password";
        emit(InvalidUserRegisterInputState(
            userRegisterError: userRegisterError));
      } else if (event.user.confirmPassword != null &&
          event.user.confirmPassword != null &&
          event.user.password != event.user.confirmPassword) {
        userRegisterError.confirmPassword =
            userRegisterError.password = "Passwords does not match";
        emit(InvalidUserRegisterInputState(
            userRegisterError: userRegisterError));
      } else if (!event.user.phoneNo!.isValidPhone()) {
        userRegisterError.phoneNo = "Invalid Phone Number";
        emit(InvalidUserRegisterInputState(
            userRegisterError: userRegisterError));
      } else if (event.user.acceptedTerms == null ||
          event.user.acceptedTerms == false) {
        userRegisterError.acceptedTerms = false;
        emit(InvalidUserRegisterInputState(
            userRegisterError: userRegisterError));
      } else {
        emit(ValidUserRegisterInputState(userRegisterError: userRegisterError));
      }
    });
  }
}
