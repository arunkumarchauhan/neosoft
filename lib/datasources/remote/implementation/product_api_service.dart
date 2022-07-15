import 'package:dio/dio.dart';
import 'package:neostore/data/datasources/product_data_source.dart';
import 'package:neostore/datasources/dto/product_detail/product_detail_response_dto.dart';
import 'package:neostore/datasources/dto/product_list/products_list_response_dto.dart';
import 'package:neostore/datasources/remote/api_service.dart';

class ProductApiService implements ProductDataSource {
  final ApiService _apiService;
  ProductApiService({required ApiService apiService})
      : _apiService = apiService;
  Future<ProductsListResponseDTO> getProductsList(
      {int productCategoryId = 1, int limit = 10, int page = 1}) async {
    String subUrl = "/products/getList";
    Map<String, dynamic> params = {
      "product_category_id": productCategoryId,
      "limit": limit,
      "page": page
    };

    final Response response =
        await _apiService.getRequest(subUrl: subUrl, params: params);

    return ProductsListResponseDTO.fromJson(response.data!);
  }

  Future<ProductDetailResponseDTO> getProductDetail(int productId) async {
    String subUrl = "/products/getDetail";
    Map<String, dynamic> params = {"product_id": productId};

    final Response response =
        await _apiService.getRequest(subUrl: subUrl, params: params);

    return ProductDetailResponseDTO.fromJson(response.data!);
  }
}
