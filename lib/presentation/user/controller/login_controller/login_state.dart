import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:neostore/presentation/user/model/user_login_cred_error_model.dart';

abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginState {
  late Either either;
  LoginSuccessState({required this.either});
  @override
  List<Object?> get props => [either];
}

class LoginFailedState extends LoginState {
  late Either either;
  LoginFailedState({required this.either});
  @override
  List<Object?> get props => [either];
}

class InvalidLoginInputState extends LoginState {
  late final UserLoginCredError userLoginCredError;
  InvalidLoginInputState({required this.userLoginCredError});
  @override
  List<Object?> get props => [userLoginCredError];
}

class ValidatingLoginInputState extends LoginState {
  ValidatingLoginInputState();
  @override
  List<Object?> get props => [];
}

class ValidLoginInputState extends LoginState {
  late final UserLoginCredError userLoginCredError;
  ValidLoginInputState({required this.userLoginCredError});
  @override
  List<Object?> get props => [userLoginCredError];
}
