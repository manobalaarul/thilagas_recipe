import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../entities/cart/cart_response_entity.dart';

abstract class CartRepository {
  Future<Either<Failure, CartResponseEntity>> getCartItems(dynamic params);
}
