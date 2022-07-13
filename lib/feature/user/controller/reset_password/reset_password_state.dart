import 'package:equatable/equatable.dart';
import 'package:neostore/core/user/domain/entity/reset_password_body_entity.dart';

abstract class ResetPasswordState extends Equatable {}

class InitializeResetPasswordState extends ResetPasswordState {
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    return "InitializeResetPasswordState";
  }
}

class ValidatingInputResetPasswordState extends ResetPasswordState {
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    return "ValidatingInputResetPasswordState ";
  }
}

class InvalidInputResetPasswordState extends ResetPasswordState {
  final ResetPasswordBodyEntity passwordBodyEntity;
  InvalidInputResetPasswordState({required this.passwordBodyEntity});
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    return "InvalidInputResetPasswordState : $passwordBodyEntity";
  }
}

class ValidInputResetPasswordState extends ResetPasswordState {
  final ResetPasswordBodyEntity passwordBodyEntity;
  ValidInputResetPasswordState({required this.passwordBodyEntity});
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    return "ValidInputResetPasswordState : $passwordBodyEntity";
  }
}
