import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../entities/cart/cart_response_entity.dart';
import '../../repository/cart/cart_repository.dart';

class GetCartUsecase implements UseCase<CartResponseEntity, dynamic> {
  final CartRepository repository;

  GetCartUsecase(this.repository);

  @override
  Future<Either<Failure, CartResponseEntity>> call(params) async {
    return await repository.getCartItems(params);
  }
}
