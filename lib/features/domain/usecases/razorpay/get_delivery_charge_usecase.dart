import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../repository/razorpay/payment_repository.dart';

class GetDeliveryChargeUsecase implements UseCase<dynamic, dynamic> {
  final RazorpayRepository repository;

  GetDeliveryChargeUsecase(this.repository);

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(params) async {
    return await repository.getDeliveryCharge(params);
  }
}
