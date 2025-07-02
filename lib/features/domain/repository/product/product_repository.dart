import 'package:dartz/dartz.dart';
import '../../entities/product/product_response_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductResponseEntity>> getProduct(dynamic params);
}
