import 'package:equatable/equatable.dart';
import 'package:neostore/feature/user/controller/forgot_password/forgot_password_event.dart';
import 'package:neostore/feature/user/page/forgot_password_screen.dart';

abstract class ForgotPasswordState extends Equatable {}

class InvalidInputForgotPasswordState extends ForgotPasswordState {
  String? error;
  InvalidInputForgotPasswordState({this.error});
  @override
  List<Object?> get props => [error];
  @override
  String toString() {
    return "InvalidInputForgotPasswordState error : $error";
  }
}

class ValidatingInputForgotPasswordState extends ForgotPasswordState {
  ValidatingInputForgotPasswordState();
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    return "ValidatingInputForgotPasswordState";
  }
}

class ValidInputForgotPasswordState extends ForgotPasswordState {
  String? error;
  ValidInputForgotPasswordState({this.error});
  @override
  List<Object?> get props => [error];
  @override
  String toString() {
    return "ValidInputForgotPasswordState error : $error";
  }
}
