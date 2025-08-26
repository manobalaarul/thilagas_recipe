import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../entities/address/address_response_entity.dart';
import '../../entities/common/common_response_entity.dart';
import '../../entities/order/order_response_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, CommonResponseEntity>> fetchUserDetails(
      dynamic params);
  Future<Either<Failure, CommonResponseEntity>> updateUserDetails(
      dynamic params);
  Future<Either<Failure, AddressResponseEntity>> getAddress(dynamic params);
  Future<Either<Failure, OrderResponseEntity>> getOrders(dynamic params);
}
