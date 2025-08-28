// razorpay_state.dart
part of 'razorpay_bloc.dart';

enum PaymentStatus {
  initial,
  creatingOrder,
  orderCreated,
  verifyingPayment,
  paymentSuccess,
  paymentFailed,
  error
}

class RazorpayState extends Equatable {
  final PaymentStatus status;
  final RazorpayOrderEntity? razorpayOrder;
  final OrderEntity? order;
  final String? errorMsg;
  final String? successMsg;

  const RazorpayState({
    this.status = PaymentStatus.initial,
    this.razorpayOrder,
    this.order,
    this.errorMsg,
    this.successMsg,
  });

  RazorpayState copyWith({
    PaymentStatus? status,
    RazorpayOrderEntity? razorpayOrder,
    OrderEntity? order,
    String? errorMsg,
    String? successMsg,
  }) {
    return RazorpayState(
      status: status ?? this.status,
      razorpayOrder: razorpayOrder ?? this.razorpayOrder,
      order: order ?? this.order,
      errorMsg: errorMsg ?? this.errorMsg,
      successMsg: successMsg ?? this.successMsg,
    );
  }

  @override
  List<Object?> get props => [
        status,
        razorpayOrder,
        order,
        errorMsg,
        successMsg,
      ];
}
