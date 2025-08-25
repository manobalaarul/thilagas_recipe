import 'package:bloc/bloc.dart';
import 'package:thilagas_recipe/features/domain/usecases/category/get_sub_category_usecase.dart';

import '../../../domain/entities/category/category_response_entity.dart';
import '../../../domain/entities/category/sub_category_response_entity.dart';
import '../../../domain/usecases/category/get_category_usecase.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategoryUsecase getCategoryUsecase;
  final GetSubCategoryUsecase getSubCategoryUsecase;

  CategoryBloc(this.getCategoryUsecase, this.getSubCategoryUsecase)
      : super(CategoryState()) {
    on<GetCategoryEvent>(_getCategory);
    on<GetSubCategoryEvent>(_getSubCategory);
  }

  _getCategory(GetCategoryEvent event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(status: CategoryStatus.loading));

    final result = await getCategoryUsecase.call({});

    result.fold((failure) {
      emit(state.copyWith(
          status: CategoryStatus.error, errorMsg: failure.message));
    }, (loadedCategory) {
      emit(state.copyWith(
          status: CategoryStatus.loaded, category: loadedCategory));
    });
  }

  _getSubCategory(
      GetSubCategoryEvent event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(subCategoryStatus: SubCategoryStatus.loading));

    final result = await getSubCategoryUsecase.call({});

    result.fold((failure) {
      emit(state.copyWith(
          subCategoryStatus: SubCategoryStatus.error,
          errorMsg: failure.message));
    }, (loadedCategory) {
      emit(state.copyWith(
          subCategoryStatus: SubCategoryStatus.loaded,
          subCategory: loadedCategory));
    });
  }
}
