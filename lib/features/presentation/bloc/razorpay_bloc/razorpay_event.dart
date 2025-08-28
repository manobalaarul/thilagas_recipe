// razorpay_event.dart
part of 'razorpay_bloc.dart';

abstract class RazorpayEvent extends Equatable {
  const RazorpayEvent();

  @override
  List<Object?> get props => [];
}

class CreateOrderEvent extends RazorpayEvent {
  final double amount;
  final String currency;
  final String? receipt;

  const CreateOrderEvent({
    required this.amount,
    this.currency = 'INR',
    this.receipt,
  });

  @override
  List<Object?> get props => [amount, currency, receipt];
}

class VerifyPaymentEvent extends RazorpayEvent {
  final List<Cart> listItems;
  final double totalAmount;
  final String addressId;
  final double subTotalAmount;
  final String razorpayOrderId;
  final String razorpayPaymentId;
  final String razorpaySignature;

  const VerifyPaymentEvent({
    required this.listItems,
    required this.totalAmount,
    required this.addressId,
    required this.subTotalAmount,
    required this.razorpayOrderId,
    required this.razorpayPaymentId,
    required this.razorpaySignature,
  });

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

class PaymentFailedEvent extends RazorpayEvent {
  final String errorMessage;

  const PaymentFailedEvent({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class ResetPaymentEvent extends RazorpayEvent {
  const ResetPaymentEvent();
}