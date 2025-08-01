import 'package:bloc/bloc.dart';
import 'package:thilagas_recipe/features/domain/usecases/product/get_product_usecase.dart';

import '../../../domain/entities/product/product_response_entity.dart';

part 'product_state.dart';
part 'product_event.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductUsecase getProductUsecase;

  ProductBloc(this.getProductUsecase) : super(ProductState()) {
    on<GetProductEvent>(_getProduct);
  }

  _getProduct(GetProductEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: ProductStatus.loading));

    final result = await getProductUsecase.call({});

    result.fold((failure) {
      emit(state.copyWith(
          status: ProductStatus.error, errorMsg: failure.message));
    }, (loadedProducts) {
      emit(state.copyWith(status: ProductStatus.loaded, products: loadedProducts));
    });
  }
}
