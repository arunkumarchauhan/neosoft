import 'package:neostore/datasources/dto/login/login_dto.dart';
import 'package:neostore/datasources/dto/register/register_dto.dart';
import 'package:neostore/datasources/dto/register/user_register_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'user_api_service.g.dart';

@RestApi(baseUrl: "http://staging.php-dev.in:8844/trainingapp/api/users/")
abstract class UserApiService {
  factory UserApiService(Dio dio, {String baseUrl}) = _UserApiService;
  @POST("register")
  Future<UserRegisterResponseDto> register(@Body() RegisterDTO registerDTO);
  @POST("login")
  Future<UserRegisterResponseDto> login(@Body() LoginDTO loginDTO);
}
