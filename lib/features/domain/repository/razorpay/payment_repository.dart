import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../entities/razorpay/razorpay_entity.dart';

abstract class RazorpayRepository {
  Future<Either<Failure, RazorpayOrderEntity>> createRazorpayOrder(
      dynamic params);
  Future<Either<Failure, OrderEntity>> verifyAndPlaceOrder(dynamic params);
}
