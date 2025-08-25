part of 'product_bloc.dart';

enum ProductStatus { initial, loading, loaded, error }

enum CategoryProductStatus { initial, loading, loaded, error }

enum SearchProductStatus { initial, loading, loaded, error }

class ProductState {
  final ProductStatus status;
  final CategoryProductStatus categoryProductStatus;
  final SearchProductStatus searchProductStatus;
  final ProductResponseEntity? products;
  final CategoryProductResponseEntity? categoryProducts;
  final SearchProductResponseEntity? searchProduct;
  final String? errorMsg;
  final String? successMsg;

  ProductState(
      {this.status = ProductStatus.initial,
      this.categoryProductStatus = CategoryProductStatus.initial,
      this.searchProductStatus = SearchProductStatus.initial,
      this.products,
      this.categoryProducts,
      this.searchProduct,
      this.errorMsg,
      this.successMsg});

  ProductState copyWith(
      {ProductStatus? status,
      CategoryProductStatus? categoryProductStatus,
      SearchProductStatus? searchProductStatus,
      final ProductResponseEntity? products,
      final CategoryProductResponseEntity? categoryProducts,
      final SearchProductResponseEntity? searchProduct,
      String? errorMsg,
      String? successMsg}) {
    return ProductState(
        status: status ?? this.status,
        categoryProductStatus:
            categoryProductStatus ?? this.categoryProductStatus,
        searchProductStatus: searchProductStatus ?? this.searchProductStatus,
        products: products ?? this.products,
        categoryProducts: categoryProducts ?? this.categoryProducts,
        searchProduct: searchProduct ?? this.searchProduct,
        errorMsg: errorMsg ?? errorMsg,
        successMsg: successMsg ?? successMsg);
  }
}
