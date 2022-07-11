import 'package:either_dart/either.dart';
import 'package:neostore/core/user/data/dto/user_response_dto.dart';
import 'package:neostore/core/user/domain/entity/user_entity.dart';
import 'package:neostore/services/api_service.dart';
import 'package:neostore/utils/models/failure.dart';

// class UserRemoteDatSource {
//   final ApiService apiService;
//   UserRemoteDatSource({required this.apiService});
//   Future<Either<Failure, UserResponseDTO>> registerUser(
//       UserEntity userEntity) async {
//     late Either<UserResponseDTO, Failure> either;
//     var response = await apiService.postRequest(
//         subUrl: "users/register", body: userEntity.toMap());
//     if (response is Failure) return Left(response);
//     return Right(UserResponseDTO.fromMap(response as Map<String, dynamic>));
//   }
// }
