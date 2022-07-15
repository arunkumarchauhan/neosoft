abstract class ForgotPasswordEvent {}

class InputChangeForgotPasswordEvent extends ForgotPasswordEvent {
  String email;
  InputChangeForgotPasswordEvent({required this.email});
  @override
  String toString() {
    return "InputChangeForgotPasswordEvent : Email : $email";
  }
}
