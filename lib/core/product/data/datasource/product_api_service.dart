import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:neostore/core/product/data/dto/product_detail_response_dto.dart';
import 'package:neostore/core/product/data/dto/products_list_response_dto.dart';
import 'package:neostore/utils/constants.dart';
import 'package:neostore/services/api_service.dart';
import 'package:retrofit/retrofit.dart';

class ProductApiService {
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
