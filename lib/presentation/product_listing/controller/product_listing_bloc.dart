import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neostore/domain/entity/product/product_list_item_entity.dart';
import 'package:neostore/domain/usecases/product/get_selected_category_product_list.dart';
import 'package:neostore/presentation/product_listing/controller/product_listing_event.dart';
import 'package:neostore/presentation/product_listing/controller/product_listing_state.dart';
import 'package:neostore/presentation/product_listing/model/product_item.dart';
import 'package:neostore/utils/event_transformer_debouncer.dart';

class ProductListingBloc
    extends Bloc<ProductListingEvent, ProductListingState> {
  final GetSelectedCategoryProductListUseCase
      _getSelectedCategoryProductListUseCase;
  List<ProductItem> products = [];
  int _categoryId = 1;
  int _page = 1;
  int _limit = 10;
  bool productEnded = false;
  Map<int, String> _categoryMap = {
    1: "Tables",
    2: "Sofas",
    3: "Chairs",
    4: "Cupboards"
  };
  String get productCategory => _categoryMap[_categoryId]!;

  ProductListingBloc({
    required GetSelectedCategoryProductListUseCase
        getSelectedCategoryProductListUseCase,
  })  : _getSelectedCategoryProductListUseCase =
            getSelectedCategoryProductListUseCase,
        super(ProductListInitializationState()) {
    on<InitiateProductListFetchEvent>((event, emit) async {
      print(event);
      emit(ProductListLoadingState());
      _categoryId = event.productCategoryId;
      productEnded = false;

      final response =
          await _getSelectedCategoryProductListUseCase.getProductsList(
              productCategoryId: event.productCategoryId,
              page: 1,
              limit: _limit);

      response.fold((left) {
        print("Failure ${left.message}");
        emit(ProductListFetchFailedState(failure: left));
      }, (right) {
        products = right;
        print("Initial Product Length ${products.length}");
        emit(ProductListFetchSuccessState(products: products));
      });
    });

    on<FetchMoreProductsListEvent>((event, emit) async {
      emit(ProductListRefetchLoadingState(products: products));
      print(
          "${event}, productCategoryId : $_categoryId , limit :$_limit , page : $_page ");
      int page = products.length ~/ 10 + 1;
      final response =
          await _getSelectedCategoryProductListUseCase.getProductsList(
              productCategoryId: _categoryId,
              page: page == 0 ? 1 : page,
              limit: _limit);

      response.fold((left) {
        print(left.message);
        emit(ProductListFetchFailedState(failure: left));
      }, (right) {
        if (right.length < 10) {
          productEnded = true;
        }
        products.addAll(right);
        print("Product Length ${products.length}");
        emit(ProductListFetchSuccessState(products: products));
      });
    }, transformer: debounce(const Duration(seconds: 1)));
  }
}
