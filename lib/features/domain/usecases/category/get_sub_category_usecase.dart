import 'package:dartz/dartz.dart';
import '../../entities/category/sub_category_response_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../repository/category/category_repository.dart';

class GetSubCategoryUsecase
    implements UseCase<SubCategoryResponseEntity, dynamic> {
  final CategoryRepository repository;

  GetSubCategoryUsecase(this.repository);

  @override
  Future<Either<Failure, SubCategoryResponseEntity>> call(params) async {
    return await repository.getSubCategory(params);
  }
}
