part of 'product_bloc.dart';


enum ProductStatus { initial, loading, loaded, error }

class ProductState {
  final ProductStatus status;
  final ProductResponseEntity? products;
  final String? errorMsg;
  final String? successMsg;

  ProductState(
      {this.status = ProductStatus.initial,
      this.products,
      this.errorMsg,
      this.successMsg});

  ProductState copyWith(
      {ProductStatus? status,
      final ProductResponseEntity? products,
      String? errorMsg,
      String? successMsg}) {
    return ProductState(
        status: status ?? this.status,
        products: products ?? this.products,
        errorMsg: errorMsg ?? this.errorMsg,
        successMsg: successMsg ?? this.successMsg);
  }
}
