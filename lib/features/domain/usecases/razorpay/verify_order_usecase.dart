// verify_payment_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../entities/cart/cart_response_entity.dart';
import '../../entities/razorpay/razorpay_entity.dart';
import '../../repository/razorpay/payment_repository.dart';

class VerifyPaymentParams extends Equatable {
  final List<Cart> listItems;
  final double totalAmount;
  final String addressId;
  final double subTotalAmount;
  final String razorpayOrderId;
  final String razorpayPaymentId;
  final String razorpaySignature;

  const VerifyPaymentParams({
    required this.listItems,
    required this.totalAmount,
    required this.addressId,
    required this.subTotalAmount,
    required this.razorpayOrderId,
    required this.razorpayPaymentId,
    required this.razorpaySignature,
  });

  Map<String, dynamic> toJson() {
    return {
      'list_items': listItems,
      'totalAmt': totalAmount,
      'address_id': addressId,
      'subTotalAmt': subTotalAmount,
      'razorpay_order_id': razorpayOrderId,
      'razorpay_payment_id': razorpayPaymentId,
      'razorpay_signature': razorpaySignature,
    };
  }

  @override
  List<Object?> get props => [
        listItems,
        totalAmount,
        addressId,
        subTotalAmount,
        razorpayOrderId,
        razorpayPaymentId,
        razorpaySignature,
      ];
}

class VerifyPaymentUsecase
    implements UseCase<OrderEntity, VerifyPaymentParams> {
  final RazorpayRepository repository;

  VerifyPaymentUsecase(this.repository);

  @override
  Future<Either<Failure, OrderEntity>> call(VerifyPaymentParams params) async {
    return await repository.verifyAndPlaceOrder(params.toJson());
  }
}
