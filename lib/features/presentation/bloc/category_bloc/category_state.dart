part of 'category_bloc.dart';

enum CategoryStatus { initial, loading, loaded, error }

class CategoryState {
  final CategoryStatus status;
  final CategoryResponseEntity? category;
  final String? errorMsg;
  final String? successMsg;

  CategoryState(
      {this.status = CategoryStatus.initial,
      this.category,
      this.errorMsg,
      this.successMsg});

  CategoryState copyWith(
      {CategoryStatus? status,
      final CategoryResponseEntity? category,
      String? errorMsg,
      String? successMsg}) {
    return CategoryState(
        status: status ?? this.status,
        category: category ?? this.category,
        errorMsg: errorMsg ?? this.errorMsg,
        successMsg: successMsg ?? this.successMsg);
  }
}
