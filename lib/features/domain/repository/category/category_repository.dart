import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../entities/category/category_response_entity.dart';
import '../../entities/category/sub_category_response_entity.dart';

abstract class CategoryRepository {
  Future<Either<Failure, CategoryResponseEntity>> getCategory(dynamic params);
  Future<Either<Failure, SubCategoryResponseEntity>> getSubCategory(
      dynamic params);
}
