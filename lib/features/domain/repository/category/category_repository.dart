import 'package:dartz/dartz.dart';
import '../../entities/category/category_response_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class CategoryRepository {
  Future<Either<Failure, CategoryResponseEntity>> getCategory(dynamic params);
}
