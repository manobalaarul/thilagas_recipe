import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../common_widgets/appbar/custom_appbar.dart';
import '../../../common_widgets/buttons/long_btn.dart';
import '../../../common_widgets/design/ask_login.dart';
import '../../../common_widgets/design/no_data.dart';
import '../../bloc/cart_bloc/cart_bloc.dart';
import '../../bloc/login_check_bloc/logincheck_bloc.dart';
import '../../utils/display_in_rupees.dart';
import 'widgets/cart_card.dart';
import 'widgets/cart_loader.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();

    // Fetch cart data when page initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final loginState = context.read<LogincheckBloc>().state;
      if (loginState.status == LogincheckStatus.authenticated) {
        print("🔥 Triggering GetCartEvent from CartPage"); // Debug log
        context.read<CartBloc>().add(GetCartEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(10),
            children: [
              const CustomAppBar(title: 'Cart'),
              BlocBuilder<LogincheckBloc, LogincheckState>(
                builder: (context, loginState) {
                  switch (loginState.status) {
                    case LogincheckStatus.checking:
                      // Show loading while checking auth
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
                          // Add debug logs
                          print("🔥 CartBloc state: ${state.status}");
                          if (state.cart != null) {
                            print("🔥 Cart items: ${state.cart!.cart.length}");
                          }

                          switch (state.status) {
                            case CartStatus.initial:
                            case CartStatus.loading:
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
          Positioned(
            bottom: 0,
            child: BlocBuilder<LogincheckBloc, LogincheckState>(
              builder: (context, loginState) {
                // Only show calculation bar for authenticated users
                if (loginState.status != LogincheckStatus.authenticated) {
                  return const SizedBox.shrink();
                }

                return BlocBuilder<CartBloc, CartState>(
                  builder: (context, cartState) {
                    // Only show calculation if cart is loaded and has items
                    if (cartState.status != CartStatus.loaded ||
                        cartState.cart == null ||
                        cartState.cart!.cart.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return Container(
                      decoration: BoxDecoration(
                        color: isDarkTheme
                            ? const Color(0xFF232323)
                            : Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      padding: const EdgeInsets.all(10),
                      width: media.width,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Total Quantity',
                                  style: TextStyle(fontSize: 17)),
                              Text(cartState.totalQty.toString(),
                                  style: const TextStyle(fontSize: 17)),
                            ],
                          ),
                          SizedBox(height: media.height / 70),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Delivery Charge',
                                  style: TextStyle(fontSize: 17)),
                              Text('Pending',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: AppLightColor.primary)),
                            ],
                          ),
                          SizedBox(height: media.height / 70),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Total',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                displayPriceInRupees(cartState.total.toInt()),
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: AppDarkColor.primary,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: media.height / 70),
                          LongBtn(
                            onPressed: () {
                              // Navigate to Checkout
                            },
                            title: "Proceed to Checkout",
                            fontSize: 20,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
