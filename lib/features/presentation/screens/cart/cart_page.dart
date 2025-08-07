import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thilagas_recipe/features/common_widgets/appbar/custom_appbar.dart';
import 'package:thilagas_recipe/features/common_widgets/cart/cart_card.dart';
import 'package:thilagas_recipe/features/presentation/bloc/cart_bloc/cart_bloc.dart';

import '../home/widgets/product/product_loader.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const CustomAppBar(title: 'Cart'),
          BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            switch (state.status) {
              case CartStatus.initial:
              case CartStatus.loading:
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.all(3),
                      child: const ProductLoader()),
                );
              case CartStatus.error:
                return Center(child: Text(state.errorMsg!));
              case CartStatus.loaded:
                final carts = state.cart!.cart;
                return CartCard(item: carts);
            }
          }),
        ],
      ),
    ));
  }
}
