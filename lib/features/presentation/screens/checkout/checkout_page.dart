import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:thilagas_recipe/features/presentation/utils/calculate_totalkg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../common_widgets/appbar/custom_appbar.dart';
import '../../../common_widgets/buttons/long_btn.dart';
import '../../../common_widgets/design/no_data.dart';
import '../../../domain/entities/razorpay/razorpay_entity.dart';
import '../../bloc/cart_bloc/cart_bloc.dart';
import '../../bloc/login_check_bloc/logincheck_bloc.dart';
import '../../bloc/razorpay_bloc/razorpay_bloc.dart';
import '../../bloc/select_address_bloc/select_address_bloc.dart';
import '../../bloc/user_bloc/user_bloc.dart';
import '../../utils/display_in_rupees.dart';
import '../profile/address/widgets/address_card.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late Razorpay _razorpay;
  RazorpayOrderEntity? _currentOrder;

  @override
  void initState() {
    super.initState();
    _initializeRazorpay();
    final cartItems = context.read<CartBloc>().state.cart!.cart;
    final address = context.read<SelectAddressBloc>().state.address;
    context
        .read<SelectAddressBloc>()
        .add(SelectOneAddressEvent(address: address!, cartItems: cartItems));
  }

  void _initializeRazorpay() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    if (_currentOrder != null) {
      // Get the current address state to get delivery charge
      final addressState = context.read<SelectAddressBloc>().state;
      final deliveryCharge = addressState.deliveryCharge ?? 0.0;
      final totalAmount = (_currentOrder!.amount / 100) + deliveryCharge;

      context.read<RazorpayBloc>().add(
            VerifyPaymentEvent(
              listItems: context.read<CartBloc>().state.cart!.cart,
              totalAmount: totalAmount, // Total including delivery
              addressId: "addressId", // TODO: dynamic
              subTotalAmount: context.read<CartBloc>().state.subTotal,
              razorpayOrderId: response.orderId ?? '',
              razorpayPaymentId: response.paymentId ?? '',
              razorpaySignature: response.signature ?? '',
            ),
          );
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    String errorMessage;

    // Check for specific error codes
    switch (response.code) {
      case Razorpay.PAYMENT_CANCELLED:
        errorMessage = 'Payment was cancelled. You pressed the back button.';
        break;
      case Razorpay.NETWORK_ERROR:
        errorMessage =
            'Network error occurred. Please check your internet connection.';
        break;
      case Razorpay.INVALID_OPTIONS:
        errorMessage = 'Invalid payment options provided.';
        break;
      case Razorpay.TLS_ERROR:
        errorMessage = 'TLS error occurred. Please try again.';
        break;
      case Razorpay.INCOMPATIBLE_PLUGIN:
        errorMessage = 'Incompatible plugin version.';
        break;
      case Razorpay.UNKNOWN_ERROR:
      default:
        errorMessage =
            response.message ?? 'An unknown error occurred during payment.';
        break;
    }

    context.read<RazorpayBloc>().add(
          PaymentFailedEvent(
            errorMessage: errorMessage,
          ),
        );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('External wallet selected: ${response.walletName}')),
    );
  }

  void _startPayment(RazorpayOrderEntity order, String userEmail,
      String userPhone, String userName, double deliveryCharge) {
    _currentOrder = order;

    var options = {
      'key': 'rzp_live_R6iTgO0OEqpXIy', // Replace with your key
      'amount': order.amount,
      'order_id': order.id,
      'currency': order.currency,
      'name': 'Thilagas Recipe',
      'description': 'Order Payment',
      'prefill': {
        'contact': userPhone,
        'email': userEmail,
        'name': userName,
      },
      'theme': {'color': '#80B500'},
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      context.read<RazorpayBloc>().add(
            PaymentFailedEvent(errorMessage: 'Error opening Razorpay: $e'),
          );
    }
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
      builder: (context) => CupertinoAlertDialog(
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
            child: const Text('Close'),
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

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Cart List
            ListView(
              padding: const EdgeInsets.all(10),
              children: [
                const CustomAppBar(
                  title: 'Checkout',
                  needBack: true,
                ),
                BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                  switch (state.getAddressStatus) {
                    case GetAddressStatus.initial:
                    case GetAddressStatus.loading:
                      return const CircularProgressIndicator();
                    case GetAddressStatus.error:
                      return Center(child: Text(state.errorMsg!));
                    case GetAddressStatus.loaded:
                      final address = state.address?.address ?? [];

                      if (address.isEmpty) {
                        return const Center(
                            child: NoData(data: "Your address list is empty"));
                      }

                      return Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: address.length,
                            itemBuilder: (context, index) {
                              return AddressCard(item: address[index]);
                            },
                          ),
                          SizedBox(
                            height: media.height / 3,
                          )
                        ],
                      );
                  }
                })
              ],
            ),

            // Checkout Section with Razorpay Bloc
            Positioned(
              bottom: 0,
              child: BlocConsumer<RazorpayBloc, RazorpayState>(
                listener: (context, state) {
                  if (state.status == PaymentStatus.orderCreated &&
                      state.razorpayOrder != null) {
                    final addressState =
                        context.read<SelectAddressBloc>().state;
                    final deliveryCharge = addressState.deliveryCharge ?? 0.0;
                    _startPayment(
                        state.razorpayOrder!,
                        "manobalaarul@gmail.com", // TODO: get from profile
                        "9500971102",
                        "Manobala",
                        deliveryCharge.toDouble());
                  } else if (state.status == PaymentStatus.paymentSuccess) {
                    _showSuccessDialog(context);
                  } else if (state.status == PaymentStatus.paymentFailed ||
                      state.status == PaymentStatus.error) {
                    _showErrorDialog(
                        context, state.errorMsg ?? "An unknown error occurred");
                  }
                },
                builder: (context, razorState) {
                  return BlocBuilder<LogincheckBloc, LogincheckState>(
                    builder: (context, loginState) {
                      if (loginState.status != LogincheckStatus.authenticated) {
                        return const SizedBox.shrink();
                      }

                      return BlocBuilder<SelectAddressBloc, SelectAddressState>(
                          builder: (context, addressState) {
                        return BlocBuilder<CartBloc, CartState>(
                          builder: (context, cartState) {
                            if (cartState.status != CartStatus.loaded ||
                                cartState.cart == null ||
                                cartState.cart!.cart.isEmpty) {
                              return const SizedBox.shrink();
                            }

                            // 🔑 Safe delivery charge handling
                            final deliveryCharge =
                                addressState.deliveryCharge ?? 0.0;
                            final isDeliveryChargeLoading =
                                addressState.status ==
                                    SelectAddressStatus.loading;
                            final hasSelectedAddress =
                                addressState.address != null;

                            return Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: isDarkTheme
                                          ? const Color(0xFF232323)
                                          : Colors.white,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      )),
                                  padding: const EdgeInsets.all(15),
                                  width: media.width,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Sub Total',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                            displayPriceInRupees(
                                                cartState.subTotal.toInt()),
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: AppLightColor.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: media.height / 70),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Total Quantity',
                                              style: TextStyle(fontSize: 17)),
                                          Text(cartState.totalQty.toString(),
                                              style: const TextStyle(
                                                  fontSize: 17)),
                                        ],
                                      ),
                                      SizedBox(height: media.height / 70),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Total Weight',
                                              style: TextStyle(fontSize: 17)),
                                          Text(
                                              "${calculateTotalKg(cartState.cart!.cart)} kg",
                                              style: const TextStyle(
                                                fontSize: 17,
                                              )),
                                        ],
                                      ),
                                      SizedBox(height: media.height / 70),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Delivery Charge',
                                              style: TextStyle(fontSize: 17)),
                                          // 🔑 Show loading or delivery charge with proper null handling
                                          isDeliveryChargeLoading
                                              ? const SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child:
                                                      CircularProgressIndicator(
                                                          strokeWidth: 2),
                                                )
                                              : hasSelectedAddress
                                                  ? Text(
                                                      displayPriceInRupees(
                                                          deliveryCharge
                                                              .toInt()),
                                                      style: const TextStyle(
                                                          fontSize: 17),
                                                    )
                                                  : const Text(
                                                      "Select address first",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                        ],
                                      ),
                                      SizedBox(height: media.height / 70),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Total',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                            displayPriceInRupees(
                                                (cartState.total +
                                                        deliveryCharge)
                                                    .toInt()),
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: AppDarkColor.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: media.height / 70),
                                      LongBtn(
                                        onPressed: (razorState.status ==
                                                    PaymentStatus
                                                        .creatingOrder ||
                                                !hasSelectedAddress ||
                                                isDeliveryChargeLoading)
                                            ? null
                                            : () {
                                                final totalAmount =
                                                    cartState.total.toDouble() +
                                                        deliveryCharge;
                                                context
                                                    .read<RazorpayBloc>()
                                                    .add(
                                                      CreateOrderEvent(
                                                        amount: totalAmount,
                                                        receipt:
                                                            'order_${DateTime.now().millisecondsSinceEpoch}',
                                                      ),
                                                    );
                                              },
                                        title: _getCheckoutButtonTitle(
                                          razorState.status,
                                          hasSelectedAddress,
                                          isDeliveryChargeLoading,
                                        ),
                                        fontSize: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔑 Helper method to get appropriate button title
  String _getCheckoutButtonTitle(
      PaymentStatus status, bool hasAddress, bool isLoading) {
    if (status == PaymentStatus.creatingOrder) {
      return "Processing...";
    }
    if (!hasAddress) {
      return "Select Address First";
    }
    if (isLoading) {
      return "Calculating Delivery...";
    }
    return "Proceed to Checkout";
  }
}
