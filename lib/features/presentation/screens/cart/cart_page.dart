import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common_widgets/appbar/custom_appbar.dart';
import '../../../common_widgets/design/ask_login.dart';
import '../../bloc/cart_bloc/cart_bloc.dart';
import '../../bloc/login_check_bloc/logincheck_bloc.dart';
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
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const CustomAppBar(title: 'Cart'),
          BlocBuilder<LogincheckBloc, LogincheckState>(
              builder: (context, state) {
            switch (state.status) {
              case LogincheckStatus.checking:
              case LogincheckStatus.authenticated:
                return BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
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
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: carts.length,
                        itemBuilder: (context, index) {
                          return CartCard(item: carts[index]);
                        },
                      );
                  }
                });

              case LogincheckStatus.unauthenticated:
                return const Center(
                    child: AskLogin(data: "Please login to check cart!"));
            }
          })
        ],
      ),
    ));
  }
}
