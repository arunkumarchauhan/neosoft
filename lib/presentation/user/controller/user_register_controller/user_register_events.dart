import 'package:neostore/domain/entity/user/user_entity.dart';

abstract class UserRegisterEvent {}

class RegisterInputChangeEvent extends UserRegisterEvent {
  final UserEntity user;
  RegisterInputChangeEvent({required this.user});
  @override
  String toString() {
    return "RegisterInputChangeEvent :  $user";
  }
}
