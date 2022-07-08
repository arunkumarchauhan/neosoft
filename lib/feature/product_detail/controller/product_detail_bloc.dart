import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neostore/core/product/domain/usecases/get_selected_product_detail.dart';
import 'package:neostore/feature/product_detail/controller/product_detail_event.dart';
import 'package:neostore/feature/product_detail/controller/product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc(
      {required GetSelectedProductDetailUseCase selectedProductDetailUseCase})
      : _useCase = selectedProductDetailUseCase,
        super(ProductDetailInitState()) {
    on<ProductDetailFetchEvent>((event, emit) async {
      emit(ProductDetailLoadingState());
      final response =
          await _useCase.getProductDetail(productId: event.productId);
      response.fold((left) {
        print(left.message);
        emit(ProductDetailFetchFailureState(failure: left));
      }, (right) {
        print(right);
        emit(ProductDetailFetchSuccessState(product: right));
      });
      print("Ended");
    });
  }

  GetSelectedProductDetailUseCase _useCase;
}
