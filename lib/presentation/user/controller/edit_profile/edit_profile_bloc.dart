import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neostore/domain/entity/user/edit_profile_body_entity.dart';
import 'package:neostore/presentation/user/controller/edit_profile/edit_profile_event.dart';
import 'package:neostore/presentation/user/controller/edit_profile/edit_profile_states.dart';
import 'package:neostore/utils/constants.dart';
import 'package:neostore/utils/extensions/email_validator.dart';
import 'package:neostore/utils/extensions/phone_validator.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(InitializeEditProfileState()) {
    on<InputChangeEditProfileEvent>((event, emit) {
      final body = event.body;
      emit(ValidatingEditProfileState());
      final errorBody = EditProfileBodyEntity();
      if (body.firstName == null || body.firstName!.isEmpty) {
        errorBody.firstName = "Invalid Firstname";
        emit(InvalidInputEditProfileState(errorBody: errorBody));
      } else if (body.lastName == null || body.lastName!.isEmpty) {
        errorBody.lastName = "Invalid Lastname";
        emit(InvalidInputEditProfileState(errorBody: errorBody));
      } else if (body.email == null || !body.email!.isValidEmail()) {
        errorBody.email = "Invalid Email";
        emit(InvalidInputEditProfileState(errorBody: errorBody));
      } else if (body.phoneNo == null || !body.phoneNo!.isValidPhone()) {
        errorBody.phoneNo = "Invalid Phone Number";
        emit(InvalidInputEditProfileState(errorBody: errorBody));
      } else if (body.dob == null || body.dob!.isEmpty || body.dob == kDob) {
        errorBody.dob = "Please choose birthdate";
        emit(InvalidInputEditProfileState(errorBody: errorBody));
      } else {
        emit(ValidInputEditProfileState(errorBody: errorBody));
      }
    });
    on<EditButtonClickedEditProfileEvent>((event, emit) {
      emit(EditButtonClickedEditProfileState(isEditing: event.isEditing));
    });
  }
}
