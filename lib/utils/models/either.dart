import 'package:either_dart/either.dart';
import 'package:neostore/utils/models/failure.dart';

class EitherHelper {
  static Either getEitherResponse(Object? obj) {
    Either _either;
    if (obj is Failure) {
      _either = Right(obj);
    } else {
      _either = Left(obj);
    }
    return _either;
  }
}
