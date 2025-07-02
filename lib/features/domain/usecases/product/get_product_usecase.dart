import 'package:dartz/dartz.dart';
import '../../entities/product/product_response_entity.dart';
import '../../repository/product/product_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';

class GetProductUsecase implements UseCase<ProductResponseEntity, dynamic> {
  final ProductRepository repository;

  GetProductUsecase(this.repository);

  @override
  Future<Either<Failure, ProductResponseEntity>> call(params) async {
    return await repository.getProduct(params);
  }
}
