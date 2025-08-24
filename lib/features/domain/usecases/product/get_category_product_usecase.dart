import 'package:dartz/dartz.dart';
import '../../entities/category/category_product_response_entity.dart';
import '../../repository/product/product_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';

class GetCategoryProductUsecase
    implements UseCase<CategoryProductResponseEntity, dynamic> {
  final ProductRepository repository;

  GetCategoryProductUsecase(this.repository);

  @override
  Future<Either<Failure, CategoryProductResponseEntity>> call(params) async {
    return await repository.getCategoryProduct(params);
  }
}
