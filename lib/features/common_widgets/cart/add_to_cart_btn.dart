import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thilagas_recipe/features/domain/entities/cart/cart_response_entity.dart';

import '../../../core/constants/app_colors.dart';
import '../../domain/entities/product/product_response_entity.dart';
import '../../domain/entities/variant/variant_entity.dart';
import '../../presentation/bloc/cart_bloc/cart_bloc.dart';

class AddToCartBtn extends StatelessWidget {
  final bool design;
  final Product product;
  final Variant variant;

  const AddToCartBtn({
    super.key,
    required this.design,
    required this.product,
    required this.variant,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        Cart? cartItemDetails;
        if (state.cart != null) {
          try {
            cartItemDetails = state.cart!.cart.firstWhere(
              (item) => item.productId.id == product.id,
            );
          } catch (_) {
            cartItemDetails = null;
          }
        }

        final isLoading = state.addCartStatus == AddCartStatus.loading ||
            state.updateCartStatus == UpdateCartStatus.loading;

        if (cartItemDetails != null) {
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
                    width: design ? media.width / 4 : media.width / 4.5,
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
                              if (cartItemDetails!.quantity == 1) {
                                context.read<CartBloc>().add(
                                      UpdateCartEvent(
                                        variant: cartItemDetails.variant,
                                        id: cartItemDetails.productId.id,
                                        qty: cartItemDetails.quantity - 1,
                                      ),
                                    );
                              } else {
                                context.read<CartBloc>().add(
                                      AddCartEvent(
                                        variant: cartItemDetails.variant,
                                        productId: cartItemDetails.productId.id,
                                      ),
                                    );
                              }
                            },
                            child: Icon(Icons.remove,
                                size: design ? 30 : 20,
                                color: AppLightColor.primary),
                          ),
                        ),
                        Text(
                          cartItemDetails.quantity.toString(),
                          style: TextStyle(
                              fontSize: design ? 20 : 17,
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
                              context.read<CartBloc>().add(
                                    UpdateCartEvent(
                                      variant: cartItemDetails!.variant,
                                      id: cartItemDetails.productId.id,
                                      qty: cartItemDetails.quantity + 1,
                                    ),
                                  );
                            },
                            child: Icon(Icons.add,
                                size: design ? 30 : 20,
                                color: AppLightColor.primary),
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        } else {
          return design
              ? ElevatedButton(
                  onPressed: () {
                    context.read<CartBloc>().add(
                        AddCartEvent(productId: product.id, variant: variant));
                  },
                  child: const Text('Add to Cart'),
                )
              : InkWell(
                  onTap: () {
                    context.read<CartBloc>().add(
                        AddCartEvent(productId: product.id, variant: variant));
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
