import 'package:dartz/dartz.dart';
import '../../remote/datasource/product/product_remote_datasource.dart';
import '../../../domain/entities/product/product_response_entity.dart';
import '../../../domain/repository/product/product_repository.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource productRemoteDatasource;
  ProductRepositoryImpl({required this.productRemoteDatasource});
  @override
  Future<Either<Failure, ProductResponseEntity>> getProduct(params) async {
    try {
      final offers = await productRemoteDatasource.getProduct(params);
      return Right(offers);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: 'Unexpected error'));
    }
  }
}
