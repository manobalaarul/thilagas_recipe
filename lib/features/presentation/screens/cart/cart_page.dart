import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:thilagas_recipe/features/presentation/screens/profile/address/my_address.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../common_widgets/appbar/custom_appbar.dart';
import '../../../common_widgets/buttons/long_btn.dart';
import '../../../common_widgets/design/ask_login.dart';
import '../../../common_widgets/design/no_data.dart';
import '../../../domain/entities/razorpay/razorpay_entity.dart';
import '../../bloc/cart_bloc/cart_bloc.dart';
import '../../bloc/login_check_bloc/logincheck_bloc.dart';
import '../../bloc/razorpay_bloc/razorpay_bloc.dart';
import '../../bloc/select_address_bloc/select_address_bloc.dart';
import '../../utils/display_in_rupees.dart';
import 'widgets/cart_card.dart';
import 'widgets/cart_loader.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
              listItems: context.read<CartBloc>().state.cart!.cart,
              totalAmount: _currentOrder!.amount / 100, // convert paise to INR
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
      String userPhone, String userName) {
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
                const CustomAppBar(title: 'Cart'),
                BlocBuilder<LogincheckBloc, LogincheckState>(
                  builder: (context, loginState) {
                    switch (loginState.status) {
                      case LogincheckStatus.checking:
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return const CartLoader();
                          },
                        );
                      case LogincheckStatus.authenticated:
                        return BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            switch (state.status) {
                              case CartStatus.loading:
                              case CartStatus.initial:
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 7,
                                  itemBuilder: (context, index) {
                                    return const CartLoader();
                                  },
                                );
                              case CartStatus.error:
                                return Center(child: Text(state.errorMsg!));
                              case CartStatus.loaded:
                                final carts = state.cart!.cart;
                                if (carts.isEmpty) {
                                  return const Center(
                                    child: NoData(data: "Your cart is empty"),
                                  );
                                }
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: carts.length,
                                  itemBuilder: (context, index) {
                                    return CartCard(
                                      item: carts[index],
                                      variant: carts[index].variant,
                                    );
                                  },
                                );
                            }
                          },
                        );
                      case LogincheckStatus.unauthenticated:
                        return const Center(
                          child: AskLogin(data: "Please login to check cart!"),
                        );
                    }
                  },
                ),
              ],
            ),

            // Checkout Section with Razorpay Bloc
            Positioned(
              bottom: 0,
              child: BlocConsumer<RazorpayBloc, RazorpayState>(
                listener: (context, state) {
                  if (state.status == PaymentStatus.orderCreated &&
                      state.razorpayOrder != null) {
                    _startPayment(
                      state.razorpayOrder!,
                      "manobalaarul@gmail.com", // TODO: get from profile
                      "9500971102",
                      "Manobala",
                    );
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

                            return Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: AppLightColor.primary,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  width: media.width,
                                  child: addressState.address != null
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: media.width / 2,
                                                  child: Text(
                                                      addressState
                                                          .address!.addressLine,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.white)),
                                                ),
                                                Text(
                                                    "${addressState.address!.city},${addressState.address!.state},${addressState.address!.pincode}",
                                                    style: const TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.white)),
                                              ],
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Get.to(const MyAddress(
                                                    title: "Select Address"));
                                              },
                                              child:
                                                  const Text("Change Address"),
                                            )
                                          ],
                                        )
                                      : InkWell(
                                          onTap: () {
                                            Get.to(const MyAddress(
                                                title: "Select Address"));
                                          },
                                          child: const Center(
                                            child: Text(
                                              "Select Address",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.white),
                                            ),
                                          )),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: isDarkTheme
                                        ? const Color(0xFF232323)
                                        : Colors.white,
                                  ),
                                  padding: const EdgeInsets.all(10),
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
                                          const Text('Delivery Charge',
                                              style: TextStyle(fontSize: 17)),
                                          Text('Pending',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color:
                                                      AppLightColor.primary)),
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
                                                cartState.total.toInt()),
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
                                        onPressed: razorState.status ==
                                                PaymentStatus.creatingOrder
                                            ? null
                                            : () {
                                                context
                                                    .read<RazorpayBloc>()
                                                    .add(
                                                      CreateOrderEvent(
                                                        amount: cartState.total
                                                            .toDouble(),
                                                        receipt:
                                                            'order_${DateTime.now().millisecondsSinceEpoch}',
                                                      ),
                                                    );
                                              },
                                        title: razorState.status ==
                                                PaymentStatus.creatingOrder
                                            ? "Processing..."
                                            : "Proceed to Checkout",
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
}
