import 'package:dartz/dartz.dart';
import 'package:thilagas_recipe/features/domain/entities/common/common_response_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../entities/wishlist/add/wishlist_add_response_entity.dart';
import '../../entities/wishlist/get/wishlist_response_entity.dart';

abstract class WishlistRepository {
  Future<Either<Failure, WishlistResponseEntity>> getWishlistItems(
      dynamic params);
  Future<Either<Failure, WishlistAddResponseEntity>> addWishlistItems(
      dynamic params);
  Future<Either<Failure, CommonResponseEntity>> removeWishlistItems(
      dynamic params);
}
