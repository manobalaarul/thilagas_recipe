part of 'product_bloc.dart';


enum ProductStatus { initial, loading, loaded, error }

class ProductState {
  final ProductStatus status;
  final ProductResponseEntity? offer;
  final String? errorMsg;
  final String? successMsg;

  ProductState(
      {this.status = ProductStatus.initial,
      this.offer,
      this.errorMsg,
      this.successMsg});

  ProductState copyWith(
      {ProductStatus? status,
      final ProductResponseEntity? offer,
      String? errorMsg,
      String? successMsg}) {
    return ProductState(
        status: status ?? this.status,
        offer: offer ?? this.offer,
        errorMsg: errorMsg ?? this.errorMsg,
        successMsg: successMsg ?? this.successMsg);
  }
}
