import 'package:bloc/bloc.dart';
import 'package:thilagas_recipe/features/domain/entities/category/category_product_response_entity.dart';
import 'package:thilagas_recipe/features/domain/entities/product/search_product_response_entity.dart';
import 'package:thilagas_recipe/features/domain/usecases/product/get_category_product_usecase.dart';
import 'package:thilagas_recipe/features/domain/usecases/product/get_product_usecase.dart';
import 'package:thilagas_recipe/features/domain/usecases/product/get_search_product_usecase.dart';

import '../../../domain/entities/product/product_response_entity.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductUsecase getProductUsecase;
  final GetCategoryProductUsecase getCategoryProductUsecase;
  final GetSearchProductUsecase getSearchProductUsecase;

  ProductBloc(this.getProductUsecase, this.getCategoryProductUsecase,
      this.getSearchProductUsecase)
      : super(ProductState()) {
    on<GetProductEvent>(_getProduct);
    on<GetCategoryProductEvent>(_getCategoryProduct);
    on<GetSearchProductEvent>(_getSearchProduct);
  }

  _getProduct(GetProductEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: ProductStatus.loading));

    final result = await getProductUsecase.call({});

    result.fold((failure) {
      emit(state.copyWith(
          status: ProductStatus.error, errorMsg: failure.message));
    }, (loadedProducts) {
      emit(state.copyWith(
          status: ProductStatus.loaded, products: loadedProducts));
    });
  }

  _getCategoryProduct(
      GetCategoryProductEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(categoryProductStatus: CategoryProductStatus.loading));

    final result =
        await getCategoryProductUsecase.call({"categoryId": event.id});

    result.fold((failure) {
      emit(state.copyWith(
          categoryProductStatus: CategoryProductStatus.error,
          errorMsg: failure.message));
    }, (loadedProducts) {
      emit(state.copyWith(
          categoryProductStatus: CategoryProductStatus.loaded,
          categoryProducts: loadedProducts));
    });
  }

  _getSearchProduct(
      GetSearchProductEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(searchProductStatus: SearchProductStatus.loading));

    final result = await getSearchProductUsecase.call({"search": event.text});

    result.fold((failure) {
      emit(state.copyWith(
          searchProductStatus: SearchProductStatus.error,
          errorMsg: failure.message));
    }, (loadedProducts) {
      emit(state.copyWith(
          searchProductStatus: SearchProductStatus.loaded,
          searchProduct: loadedProducts));
    });
  }
}
