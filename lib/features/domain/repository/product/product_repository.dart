import 'package:dartz/dartz.dart';
import 'package:thilagas_recipe/features/domain/entities/category/category_product_response_entity.dart';
import 'package:thilagas_recipe/features/domain/entities/product/search_product_response_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../entities/product/product_response_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductResponseEntity>> getProduct(dynamic params);
  Future<Either<Failure, CategoryProductResponseEntity>> getCategoryProduct(
      dynamic params);
  Future<Either<Failure, SearchProductResponseEntity>> getSearchProduct(
      dynamic params);
}
