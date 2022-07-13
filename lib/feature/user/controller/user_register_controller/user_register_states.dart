import 'package:equatable/equatable.dart';
import 'package:neostore/core/user/domain/entity/user_entity.dart';

abstract class UserRegisterState extends Equatable {}

class InitializeUserRegisterState extends UserRegisterState {
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    return "InitializeRegisterState";
  }
}

class InvalidUserRegisterInputState extends UserRegisterState {
  late UserEntity userRegisterError;
  InvalidUserRegisterInputState({required this.userRegisterError});
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    return "InvalidRegisterInputState $userRegisterError";
  }
}

class ValidatingRegisterInputState extends UserRegisterState {
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    return "ValidatingRegisterInputState ";
  }
}

class ValidUserRegisterInputState extends UserRegisterState {
  late UserEntity userRegisterError;
  ValidUserRegisterInputState({required this.userRegisterError});
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    return "ValidRegisterInputState $userRegisterError";
  }
}
