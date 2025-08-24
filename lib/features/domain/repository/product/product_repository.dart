import 'package:dartz/dartz.dart';
import 'package:thilagas_recipe/features/domain/entities/category/category_product_response_entity.dart';
import '../../entities/product/product_response_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductResponseEntity>> getProduct(dynamic params);
  Future<Either<Failure, CategoryProductResponseEntity>> getCategoryProduct(
      dynamic params);
}
