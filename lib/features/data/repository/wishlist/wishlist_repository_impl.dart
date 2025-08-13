import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../domain/entities/common/common_response_entity.dart';
import '../../../domain/entities/wishlist/add/wishlist_add_response_entity.dart';
import '../../../domain/entities/wishlist/get/wishlist_response_entity.dart';
import '../../../domain/repository/wishlist/wishlist_repository.dart';
import '../../remote/datasource/wishlist/wishlist_remote_datasource.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistRemoteDatasource wishlistRemoteDatasource;
  WishlistRepositoryImpl({required this.wishlistRemoteDatasource});
  @override
  Future<Either<Failure, WishlistResponseEntity>> getWishlistItems(
      params) async {
    try {
      final wishlists = await wishlistRemoteDatasource.getWishlistItems(params);
      return Right(wishlists);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ServerFailure(message: 'Unexpected error'));
    }
  }

  @override
  Future<Either<Failure, WishlistAddResponseEntity>> addWishlistItems(
      params) async {
    try {
      final addedItem = await wishlistRemoteDatasource.addWishlistItems(params);
      return Right(addedItem);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ServerFailure(message: 'Unexpected error'));
    }
  }

  @override
  Future<Either<Failure, CommonResponseEntity>> removeWishlistItems(
      params) async {
    try {
      final removedItem =
          await wishlistRemoteDatasource.removeWishlistItems(params);
      return Right(removedItem);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ServerFailure(message: 'Unexpected error'));
    }
  }
}
