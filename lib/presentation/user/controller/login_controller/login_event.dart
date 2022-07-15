import 'package:neostore/domain/repositories/user_login_cred_entity.dart';

abstract class LoginEvent {}

class InitiateLoginEvent extends LoginEvent {
  @override
  String toString() => "InitiateLoginEvent";
}

class SuccessLoginEvent extends LoginEvent {
  @override
  String toString() => "FailedLoginEvent";
}

class InvalidCredentialsLoginEvent extends LoginEvent {
  @override
  String toString() => "InvalidCredentialsLoginEvent";
}

class LoginInputChangeEvent extends LoginEvent {
  UserLoginCredEntity userLoginCred;
  LoginInputChangeEvent({required this.userLoginCred});
}
