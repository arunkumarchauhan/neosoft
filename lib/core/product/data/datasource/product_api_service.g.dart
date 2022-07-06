// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ProductApiService implements ProductApiService {
  _ProductApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://staging.php-dev.in:8844/trainingapp/api/products/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ProductsListResponseDTO> getProductsList(productCategoryId,
      {limit = 10, page = 1}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'product_category_id': productCategoryId,
      r'limit': limit,
      r'page': page
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ProductsListResponseDTO>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'getList',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ProductsListResponseDTO.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ProductDetailResponseDTO> getProductDetail(productId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'product_id': productId};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ProductDetailResponseDTO>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'getDetail',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ProductDetailResponseDTO.fromJson(_result.data!);
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
