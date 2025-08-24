part of 'product_bloc.dart';

enum ProductStatus { initial, loading, loaded, error }

enum CategoryProductStatus { initial, loading, loaded, error }

class ProductState {
  final ProductStatus status;
  final CategoryProductStatus categoryProductStatus;
  final ProductResponseEntity? products;
  final CategoryProductResponseEntity? categoryProducts;
  final String? errorMsg;
  final String? successMsg;

  ProductState(
      {this.status = ProductStatus.initial,
      this.categoryProductStatus = CategoryProductStatus.initial,
      this.products,
      this.categoryProducts,
      this.errorMsg,
      this.successMsg});

  ProductState copyWith(
      {ProductStatus? status,
      CategoryProductStatus? categoryProductStatus,
      final ProductResponseEntity? products,
      final CategoryProductResponseEntity? categoryProducts,
      String? errorMsg,
      String? successMsg}) {
    return ProductState(
        status: status ?? this.status,
        categoryProductStatus:
            categoryProductStatus ?? this.categoryProductStatus,
        products: products ?? this.products,
        categoryProducts: categoryProducts ?? this.categoryProducts,
        errorMsg: errorMsg ?? this.errorMsg,
        successMsg: successMsg ?? this.successMsg);
  }
}
