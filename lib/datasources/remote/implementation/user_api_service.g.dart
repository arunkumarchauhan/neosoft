// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../datasources/remote/implementation/user_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _UserApiService implements UserApiService {
  _UserApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://staging.php-dev.in:8844/trainingapp/api/users/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<UserRegisterResponseDto> register(registerDTO) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(registerDTO.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserRegisterResponseDto>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'register',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserRegisterResponseDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserRegisterResponseDto> login(loginDTO) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(loginDTO.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserRegisterResponseDto>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserRegisterResponseDto.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
