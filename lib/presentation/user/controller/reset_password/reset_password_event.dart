import 'package:neostore/domain/entity/user/reset_password_body_entity.dart';

abstract class ResetPasswordEvent {}

class InputChangeResetPasswordEvent extends ResetPasswordEvent {
  ResetPasswordBodyEntity passwordBodyEntity;
  InputChangeResetPasswordEvent({required this.passwordBodyEntity});
  @override
  String toString() {
    return "InputChangeResetPasswordEvent $passwordBodyEntity";
  }
}
