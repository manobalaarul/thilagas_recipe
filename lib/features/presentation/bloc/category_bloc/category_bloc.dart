import 'package:bloc/bloc.dart';
import '../../../domain/entities/category/category_response_entity.dart';
import '../../../domain/usecases/category/get_category_usecase.dart';

part 'category_state.dart';
part 'category_event.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategoryUsecase getCategoryUsecase;

  CategoryBloc(this.getCategoryUsecase) : super(CategoryState()) {
    on<GetCategoryEvent>(_getCategory);
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
}
