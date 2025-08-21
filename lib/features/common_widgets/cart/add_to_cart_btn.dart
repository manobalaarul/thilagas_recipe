import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thilagas_recipe/features/domain/entities/cart/cart_response_entity.dart';

import '../../../core/constants/app_colors.dart';
import '../../domain/entities/variant/variant_entity.dart';
import '../../presentation/bloc/cart_bloc/cart_bloc.dart';

class AddToCartBtn extends StatefulWidget {
  final bool design;
  final String productId;
  final Variant variant;

  const AddToCartBtn({
    super.key,
    required this.design,
    required this.productId,
    required this.variant,
  });

  @override
  State<AddToCartBtn> createState() => _AddToCartBtnState();
}

class _AddToCartBtnState extends State<AddToCartBtn> {
  int? localCartQty; // optimistic UI qty
  bool loading = false;

  Future<void> handleAddToCart(
    BuildContext context, {
    required String productId,
    required Variant variant,
  }) async {
    setState(() {
      localCartQty = 1; // show instantly
      loading = true;
    });

    context.read<CartBloc>().add(
          AddCartEvent(productId: productId, variant: variant),
        );

    setState(() => loading = false);
    context.read<CartBloc>().add(GetCartEvent());
  }

  Future<void> handleUpdateCart(
    BuildContext context, {
    required String cartId,
    required Variant variant,
    required int qty,
  }) async {
    setState(() {
      localCartQty = qty; // update instantly
      loading = true;
    });

    context.read<CartBloc>().add(
          UpdateCartEvent(
            id: cartId,
            variant: variant,
            qty: qty,
          ),
        );

    setState(() => loading = false);
    context.read<CartBloc>().add(GetCartEvent());
  }

  Future<void> handleDeleteCart(
    BuildContext context, {
    required String cartId,
    required int qty,
  }) async {
    setState(() {
      localCartQty = qty; // update instantly
      loading = true;
    });

    context.read<CartBloc>().add(
          DeleteCartEvent(
            id: cartId,
          ),
        );

    setState(() => loading = false);
    context.read<CartBloc>().add(GetCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        Cart? cartItemDetails;
        if (state.cart != null) {
          try {
            cartItemDetails = state.cart!.cart.firstWhere(
              (item) => item.productId.id == widget.productId,
            );
          } catch (_) {
            cartItemDetails = null;
          }
        }

        final isLoading = loading ||
            state.addCartStatus == AddCartStatus.loading ||
            state.updateCartStatus == UpdateCartStatus.loading;

        // prefer local qty first -> then bloc qty -> else 0
        final qty = localCartQty ?? cartItemDetails?.quantity ?? 0;

        if (qty > 0) {
          return Container(
            width: media.width / 4.5,
            alignment: Alignment.center,
            child: isLoading
                ? const SizedBox(
                    width: 15,
                    height: 15,
                    child: Center(
                        child: CircularProgressIndicator(strokeWidth: 2)),
                  )
                : SizedBox(
                    width: widget.design ? media.width / 4 : media.width / 4.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: AppLightColor.primary),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: InkWell(
                            onTap: () {
                              if (qty > 1) {
                                handleUpdateCart(
                                  context,
                                  cartId: cartItemDetails!.id,
                                  variant: widget.variant,
                                  qty: qty - 1,
                                );
                              } else {
                                handleDeleteCart(
                                  context,
                                  cartId: cartItemDetails!.id,
                                  qty: 0,
                                );
                              }
                            },
                            child: Icon(Icons.remove,
                                size: widget.design ? 30 : 20,
                                color: AppLightColor.primary),
                          ),
                        ),
                        Text(
                          qty.toString(),
                          style: TextStyle(
                              fontSize: widget.design ? 20 : 17,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: AppLightColor.primary),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: InkWell(
                            onTap: () {
                              handleUpdateCart(
                                context,
                                cartId: cartItemDetails!.id,
                                variant: widget.variant,
                                qty: qty + 1,
                              );
                            },
                            child: Icon(Icons.add,
                                size: widget.design ? 30 : 20,
                                color: AppLightColor.primary),
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        } else {
          return widget.design
              ? ElevatedButton(
                  onPressed: () {
                    handleAddToCart(
                      context,
                      productId: widget.productId,
                      variant: widget.variant,
                    );
                  },
                  child: const Text('Add to Cart'),
                )
              : InkWell(
                  onTap: () {
                    handleAddToCart(
                      context,
                      productId: widget.productId,
                      variant: widget.variant,
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
  }
}
