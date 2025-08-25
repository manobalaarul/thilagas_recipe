part of 'category_bloc.dart';

enum CategoryStatus { initial, loading, loaded, error }

enum SubCategoryStatus { initial, loading, loaded, error }

class CategoryState {
  final CategoryStatus status;
  final SubCategoryStatus subCategoryStatus;
  final CategoryResponseEntity? category;
  final SubCategoryResponseEntity? subCategory;
  final String? errorMsg;
  final String? successMsg;

  CategoryState(
      {this.status = CategoryStatus.initial,
      this.subCategoryStatus = SubCategoryStatus.initial,
      this.category,
      this.subCategory,
      this.errorMsg,
      this.successMsg});

  CategoryState copyWith(
      {CategoryStatus? status,
      SubCategoryStatus? subCategoryStatus,
      final CategoryResponseEntity? category,
      final SubCategoryResponseEntity? subCategory,
      String? errorMsg,
      String? successMsg}) {
    return CategoryState(
        status: status ?? this.status,
        subCategoryStatus: subCategoryStatus ?? this.subCategoryStatus,
        category: category ?? this.category,
        subCategory: subCategory ?? this.subCategory,
        errorMsg: errorMsg ?? this.errorMsg,
        successMsg: successMsg ?? this.successMsg);
  }
}
