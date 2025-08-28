// razorpay_payment_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../domain/entities/cart/cart_response_entity.dart';
import '../../../domain/entities/razorpay/razorpay_entity.dart';
import '../../bloc/razorpay_bloc/razorpay_bloc.dart';

class RazorpayPaymentWidget extends StatefulWidget {
  final double amount;
  final List<Cart> cartItems;
  final String addressId;
  final double subTotal;
  final String userEmail;
  final String userPhone;
  final String userName;

  const RazorpayPaymentWidget({
    super.key,
    required this.amount,
    required this.cartItems,
    required this.addressId,
    required this.subTotal,
    required this.userEmail,
    required this.userPhone,
    required this.userName,
  });

  @override
  State<RazorpayPaymentWidget> createState() => _RazorpayPaymentWidgetState();
}

class _RazorpayPaymentWidgetState extends State<RazorpayPaymentWidget> {
  late Razorpay _razorpay;
  RazorpayOrderEntity? _currentOrder;

  @override
  void initState() {
    super.initState();
    _initializeRazorpay();
  }

  void _initializeRazorpay() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    if (_currentOrder != null) {
      context.read<RazorpayBloc>().add(
            VerifyPaymentEvent(
              listItems: widget.cartItems,
              totalAmount: widget.amount,
              addressId: widget.addressId,
              subTotalAmount: widget.subTotal,
              razorpayOrderId: response.orderId ?? '',
              razorpayPaymentId: response.paymentId ?? '',
              razorpaySignature: response.signature ?? '',
            ),
          );
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    context.read<RazorpayBloc>().add(
          PaymentFailedEvent(
            errorMessage: response.message ?? 'Payment failed',
          ),
        );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('External wallet selected: ${response.walletName}')),
    );
  }

  void _startPayment(RazorpayOrderEntity order) {
    _currentOrder = order;

    var options = {
      'key': 'rzp_live_R6iTgO0OEqpXIy', // Replace with your actual key
      'amount': order.amount,
      'order_id': order.id,
      'currency': order.currency,
      'name': 'Thilagas Recipe',
      'description': 'Order Payment',
      'prefill': {
        'contact': widget.userPhone,
        'email': widget.userEmail,
        'name': widget.userName,
      },
      'theme': {
        'color': '#80B500',
      },
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      context.read<RazorpayBloc>().add(
            PaymentFailedEvent(errorMessage: 'Error opening Razorpay: $e'),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RazorpayBloc, RazorpayState>(
      listener: (context, state) {
        switch (state.status) {
          case PaymentStatus.orderCreated:
            if (state.razorpayOrder != null) {
              _startPayment(state.razorpayOrder!);
            }
            break;
          case PaymentStatus.paymentSuccess:
            _showSuccessDialog(context);
            break;
          case PaymentStatus.error:
          case PaymentStatus.paymentFailed:
            _showErrorDialog(context, state.errorMsg ?? 'Payment failed');
            break;
          default:
            break;
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildOrderSummary(),
            const SizedBox(height: 20),
            _buildPayButton(state),
            if (state.status == PaymentStatus.creatingOrder ||
                state.status == PaymentStatus.verifyingPayment)
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
          ],
        );
      },
    );
  }

  Widget _buildOrderSummary() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Subtotal:'),
                Text('₹${widget.subTotal.toStringAsFixed(2)}'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '₹${widget.amount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPayButton(RazorpayState state) {
    final isLoading = state.status == PaymentStatus.creatingOrder ||
        state.status == PaymentStatus.verifyingPayment;

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: isLoading
            ? null
            : () {
                context.read<RazorpayBloc>().add(
                      CreateOrderEvent(
                        amount: widget.amount,
                        receipt:
                            'order_${DateTime.now().millisecondsSinceEpoch}',
                      ),
                    );
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                'Pay ₹${widget.amount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 30),
            SizedBox(width: 10),
            Text('Payment Successful!'),
          ],
        ),
        content: const Text('Your order has been placed successfully.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Navigate to order confirmation or home page
              // Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.error, color: Colors.red, size: 30),
            SizedBox(width: 10),
            Text('Payment Failed'),
          ],
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<RazorpayBloc>().add(const ResetPaymentEvent());
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
