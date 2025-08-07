import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../domain/entities/cart/cart_response_entity.dart';
import '../../../domain/repository/cart/cart_repository.dart';
import '../../remote/datasource/cart/cart_remote_datasource.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDatasource cartRemoteDatasource;
  CartRepositoryImpl({required this.cartRemoteDatasource});
  @override
  Future<Either<Failure, CartResponseEntity>> getCartItems(params) async {
    try {
      final offers = await cartRemoteDatasource.getCartItems(params);
      return Right(offers);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ServerFailure(message: 'Unexpected error'));
    }
  }
}
