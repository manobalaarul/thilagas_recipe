import 'package:dartz/dartz.dart';
import 'package:thilagas_recipe/features/domain/entities/category/category_product_response_entity.dart';
import 'package:thilagas_recipe/features/domain/entities/product/search_product_response_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../domain/entities/product/product_response_entity.dart';
import '../../../domain/repository/product/product_repository.dart';
import '../../remote/datasource/product/product_remote_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource productRemoteDatasource;
  ProductRepositoryImpl({required this.productRemoteDatasource});
  @override
  Future<Either<Failure, ProductResponseEntity>> getProduct(params) async {
    try {
      final products = await productRemoteDatasource.getProduct(params);
      return Right(products);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ServerFailure(message: 'Unexpected error'));
    }
  }

  @override
  Future<Either<Failure, CategoryProductResponseEntity>> getCategoryProduct(
      params) async {
    try {
      final product = await productRemoteDatasource.getCategoryProduct(params);
      return Right(product);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ServerFailure(message: 'Unexpected error'));
    }
  }

  @override
  Future<Either<Failure, SearchProductResponseEntity>> getSearchProduct(
      params) async {
    try {
      final product = await productRemoteDatasource.getSearchProduct(params);
      return Right(product);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ServerFailure(message: 'Unexpected error'));
    }
  }
}
