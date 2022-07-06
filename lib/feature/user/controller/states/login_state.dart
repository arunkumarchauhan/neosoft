import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginState {
  late Either either;
  LoginSuccessState({required this.either});
  @override
  List<Object?> get props => [];
}

class LoginFailedState extends LoginState {
  late Either either;
  LoginFailedState({required this.either});
  @override
  List<Object?> get props => [];
}
