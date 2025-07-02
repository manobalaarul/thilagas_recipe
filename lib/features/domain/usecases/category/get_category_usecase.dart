import 'package:dartz/dartz.dart';
import '../../entities/category/category_response_entity.dart';
import '../../repository/category/category_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';

class GetCategoryUsecase implements UseCase<CategoryResponseEntity, dynamic> {
  final CategoryRepository repository;

  GetCategoryUsecase(this.repository);

  @override
  Future<Either<Failure, CategoryResponseEntity>> call(params) async {
    return await repository.getCategory(params);
  }
}
