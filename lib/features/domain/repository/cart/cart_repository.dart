import 'package:dartz/dartz.dart';
import 'package:thilagas_recipe/features/domain/entities/common/common_response_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../entities/cart/cart_response_entity.dart';

abstract class CartRepository {
  Future<Either<Failure, CartResponseEntity>> getCartItems(dynamic params);
  Future<Either<Failure, CommonResponseEntity>> addCartItems(dynamic params);
  Future<Either<Failure, CommonResponseEntity>> updateCartItems(dynamic params);
  Future<Either<Failure, CommonResponseEntity>> deleteCartItems(dynamic params);
}
