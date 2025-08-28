import 'package:equatable/equatable.dart';

class RazorpayOrder extends Equatable {
  final String id;
  final int amount;
  final String currency;
  final String receipt;
  final String status;

  const RazorpayOrder({
    required this.id,
    required this.amount,
    required this.currency,
    required this.receipt,
    required this.status,
  });

  factory RazorpayOrder.fromJson(Map<String, dynamic> json) {
    return RazorpayOrder(
      id: json['id'] ?? '',
      amount: json['amount'] ?? 0,
      currency: json['currency'] ?? 'INR',
      receipt: json['receipt'] ?? '',
      status: json['status'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, amount, currency, receipt, status];
}

class PaymentRequest extends Equatable {
  final List<Map<String, dynamic>> listItems;
  final double totalAmt;
  final String addressId;
  final double subTotalAmt;
  final String razorpayOrderId;
  final String razorpayPaymentId;
  final String razorpaySignature;

  const PaymentRequest({
    required this.listItems,
    required this.totalAmt,
    required this.addressId,
    required this.subTotalAmt,
    required this.razorpayOrderId,
    required this.razorpayPaymentId,
    required this.razorpaySignature,
  });

  Map<String, dynamic> toJson() {
    return {
      'list_items': listItems,
      'totalAmt': totalAmt,
      'address_id': addressId,
      'subTotalAmt': subTotalAmt,
      'razorpay_order_id': razorpayOrderId,
      'razorpay_payment_id': razorpayPaymentId,
      'razorpay_signature': razorpaySignature,
    };
  }

  @override
  List<Object?> get props => [
        listItems,
        totalAmt,
        addressId,
        subTotalAmt,
        razorpayOrderId,
        razorpayPaymentId,
        razorpaySignature,
      ];
}
