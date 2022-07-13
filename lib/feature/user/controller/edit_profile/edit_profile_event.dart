import 'package:neostore/core/user/domain/entity/edit_profile_body_entity.dart';

abstract class EditProfileEvent {}

class InputChangeEditProfileEvent extends EditProfileEvent {
  final EditProfileBodyEntity body;
  InputChangeEditProfileEvent({required this.body});
  @override
  String toString() {
    return "InputChangeEditProfileEvent : $body";
  }
}

class EditButtonClickedEditProfileEvent extends EditProfileEvent {
  final bool isEditing;
  EditButtonClickedEditProfileEvent({required this.isEditing});
  @override
  String toString() {
    return "EditButtonClickedEditProfileEvent : $isEditing";
  }
}
