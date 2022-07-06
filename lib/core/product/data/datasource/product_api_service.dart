import 'package:dio/dio.dart';
import 'package:neostore/core/product/data/dto/product_detail_response_dto.dart';
import 'package:neostore/core/product/data/dto/products_list_response_dto.dart';
import 'package:retrofit/retrofit.dart';
part 'product_api_service.g.dart';

@RestApi(baseUrl: "http://staging.php-dev.in:8844/trainingapp/api/products/")
abstract class ProductApiService {
  factory ProductApiService(Dio dio, {String baseUrl}) = _ProductApiService;
  @GET("getList")
  Future<ProductsListResponseDTO> getProductsList(
      @Query("product_category_id") int productCategoryId,
      {@Query("limit") int limit = 10,
      @Query("page") int page = 1});
  @GET("getDetail")
  Future<ProductDetailResponseDTO> getProductDetail(
      @Query("product_id") int productId);
}
