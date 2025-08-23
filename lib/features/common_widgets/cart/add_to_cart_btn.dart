import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/constants/app_colors.dart';
import '../../domain/entities/cart/cart_response_entity.dart';
import '../../domain/entities/variant/variant_entity.dart';
import '../../presentation/bloc/cart_bloc/cart_bloc.dart';
import '../../presentation/bloc/login_check_bloc/logincheck_bloc.dart';

class AddToCartBtn extends StatelessWidget {
  final bool design;
  final String productId;
  final Variant variant;

  const AddToCartBtn({
    super.key,
    required this.design,
    required this.productId,
    required this.variant,
  });

  void _showLoginToast() {
    Fluttertoast.showToast(
      msg: "Please log in to manage your cart",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return BlocBuilder<LogincheckBloc, LogincheckState>(
      builder: (context, loginState) {
        return BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            Cart? cartItemDetails;
            if (state.cart != null) {
              try {
                cartItemDetails = state.cart!.cart.firstWhere(
                  (item) => item.productId.id == productId,
                );
              } catch (_) {
                cartItemDetails = null;
              }
            }

            final qty = cartItemDetails?.quantity ?? 0;

            // 👇 Show loading only for this product
            final isLoading = (state.addCartStatus == AddCartStatus.loading ||
                    state.updateCartStatus == UpdateCartStatus.loading ||
                    state.deleteCartStatus == DeleteCartStatus.loading) &&
                state.processingProductId == productId;

            if (qty > 0) {
              return Container(
                width: media.width / 4.5,
                alignment: Alignment.center,
                child: isLoading
                    ? const SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : SizedBox(
                        width: design ? media.width / 4 : media.width / 4.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _actionBtn(
                              icon: Icons.remove,
                              size: design ? 30 : 20,
                              onTap: () {
                                if (loginState.status ==
                                    LogincheckStatus.unauthenticated) {
                                  _showLoginToast();
                                  return;
                                }
                                if (qty > 1) {
                                  context.read<CartBloc>().add(
                                        UpdateCartEvent(
                                          id: cartItemDetails!.id,
                                          variant: variant,
                                          qty: qty - 1,
                                        ),
                                      );
                                } else {
                                  context.read<CartBloc>().add(
                                        DeleteCartEvent(
                                            id: cartItemDetails!.id),
                                      );
                                }
                              },
                            ),
                            Text(
                              qty.toString(),
                              style: TextStyle(
                                fontSize: design ? 20 : 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            _actionBtn(
                              icon: Icons.add,
                              size: design ? 30 : 20,
                              onTap: () {
                                if (loginState.status ==
                                    LogincheckStatus.unauthenticated) {
                                  _showLoginToast();
                                  return;
                                }
                                context.read<CartBloc>().add(
                                      UpdateCartEvent(
                                        id: cartItemDetails!.id,
                                        variant: variant,
                                        qty: qty + 1,
                                      ),
                                    );
                              },
                            ),
                          ],
                        ),
                      ),
              );
            } else {
              return design
                  ? ElevatedButton(
                      onPressed: () {
                        if (loginState.status ==
                            LogincheckStatus.unauthenticated) {
                          _showLoginToast();
                          return;
                        }
                        context.read<CartBloc>().add(
                              AddCartEvent(
                                  productId: productId, variant: variant),
                            );
                      },
                      child: isLoading
                          ? const SizedBox(
                              width: 15,
                              height: 15,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Add to Cart'),
                    )
                  : InkWell(
                      onTap: () {
                        if (loginState.status ==
                            LogincheckStatus.unauthenticated) {
                          _showLoginToast();
                          return;
                        }
                        context.read<CartBloc>().add(
                              AddCartEvent(
                                  productId: productId, variant: variant),
                            );
                      },
                      child: isLoading
                          ? const SizedBox(
                              width: 15,
                              height: 15,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Icon(Icons.shopping_cart_outlined,
                              color: AppLightColor.primary),
                    );
            }
          },
        );
      },
    );
  }

  Widget _actionBtn({
    required IconData icon,
    required double size,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppLightColor.primary),
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: onTap,
        child: Icon(icon, size: size, color: AppLightColor.primary),
      ),
    );
  }
}
