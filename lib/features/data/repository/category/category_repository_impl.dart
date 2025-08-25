import 'package:dartz/dartz.dart';
import 'package:thilagas_recipe/features/domain/entities/category/sub_category_response_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../domain/entities/category/category_response_entity.dart';
import '../../../domain/repository/category/category_repository.dart';
import '../../remote/datasource/category/category_remote_datasource.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDatasource categoryRemoteDatasource;
  CategoryRepositoryImpl({required this.categoryRemoteDatasource});
  @override
  Future<Either<Failure, CategoryResponseEntity>> getCategory(params) async {
    try {
      final offers = await categoryRemoteDatasource.getCategory(params);
      return Right(offers);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ServerFailure(message: 'Unexpected error'));
    }
  }

  @override
  Future<Either<Failure, SubCategoryResponseEntity>> getSubCategory(
      params) async {
    try {
      final offers = await categoryRemoteDatasource.getSubCategory(params);
      return Right(offers);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ServerFailure(message: 'Unexpected error'));
    }
  }
}
