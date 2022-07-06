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
