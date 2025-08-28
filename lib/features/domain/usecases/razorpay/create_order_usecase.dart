// create_order_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../entities/razorpay/razorpay_entity.dart';
import '../../repository/razorpay/payment_repository.dart';

class CreateOrderParams extends Equatable {
  final double amount;
  final String currency;
  final String? receipt;

  const CreateOrderParams({
    required this.amount,
    this.currency = 'INR',
    this.receipt,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': (amount).toInt(), // Razorpay expects amount in paise
      'currency': currency,
      if (receipt != null) 'receipt': receipt,
    };
  }

  @override
  List<Object?> get props => [amount, currency, receipt];
}

class CreateOrderUsecase
    implements UseCase<RazorpayOrderEntity, CreateOrderParams> {
  final RazorpayRepository repository;

  CreateOrderUsecase(this.repository);

  @override
  Future<Either<Failure, RazorpayOrderEntity>> call(
      CreateOrderParams params) async {
    return await repository.createRazorpayOrder(params.toJson());
  }
}
