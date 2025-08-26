import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../entities/order/order_response_entity.dart';
import '../../repository/user/user_repository.dart';

class GetOrderUsecase implements UseCase<OrderResponseEntity, dynamic> {
  final UserRepository repository;

  GetOrderUsecase(this.repository);

  @override
  Future<Either<Failure, OrderResponseEntity>> call(params) async {
    return await repository.getOrders(params);
  }
}
