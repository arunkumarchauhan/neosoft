class UserLoginCredError {
  String? userNameError;
  String? userPasswordError;
  UserLoginCredError({this.userNameError, this.userPasswordError});
  @override
  String toString() {
    return "UserLoginCredError : userNameError : ${userNameError}, PasswordError : $userPasswordError";
  }
}
