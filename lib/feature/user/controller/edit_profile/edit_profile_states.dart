import 'package:equatable/equatable.dart';
import 'package:neostore/core/user/domain/entity/edit_profile_body_entity.dart';

abstract class EditProfileState extends Equatable {}

class InitializeEditProfileState extends EditProfileState {
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    return "EditProfileInitState";
  }
}

class ValidatingEditProfileState extends EditProfileState {
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    return "ValidatingEditProfileState";
  }
}

class InvalidInputEditProfileState extends EditProfileState {
  final EditProfileBodyEntity errorBody;
  InvalidInputEditProfileState({required this.errorBody});
  @override
  List<Object?> get props => [errorBody];
  @override
  String toString() {
    return "InvalidInputEditProfileState $errorBody";
  }
}

class ValidInputEditProfileState extends EditProfileState {
  final EditProfileBodyEntity errorBody;
  ValidInputEditProfileState({required this.errorBody});
  @override
  List<Object?> get props => [errorBody];
  @override
  String toString() {
    return "ValidInputEditProfileState $errorBody";
  }
}

class EditButtonClickedEditProfileState extends EditProfileState {
  final bool isEditing;
  EditButtonClickedEditProfileState({required this.isEditing});
  @override
  String toString() {
    return "EditButtonClickedEditProfileState : $isEditing";
  }

  @override
  List<Object?> get props => [isEditing];
}
