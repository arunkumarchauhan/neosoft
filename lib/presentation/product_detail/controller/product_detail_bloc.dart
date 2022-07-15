import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neostore/domain/usecases/product/get_selected_product_detail.dart';
import 'package:neostore/presentation/product_detail/controller/product_detail_event.dart';
import 'package:neostore/presentation/product_detail/controller/product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  GetSelectedProductDetailUseCase _useCase;

  ProductDetailBloc(
      {required GetSelectedProductDetailUseCase selectedProductDetailUseCase})
      : _useCase = selectedProductDetailUseCase,
        super(ProductDetailInitState()) {
    on<ProductDetailFetchEvent>((event, emit) async {
      emit(ProductDetailLoadingState());
      final response =
          await _useCase.getProductDetail(productId: event.productId);
      response.fold((left) {
        debugPrint(left.message);
        emit(ProductDetailFetchFailureState(failure: left));
      }, (right) {
        debugPrint(right.toString());
        emit(ProductDetailFetchSuccessState(product: right));
      });
      debugPrint("Ended");
    });
  }
}
