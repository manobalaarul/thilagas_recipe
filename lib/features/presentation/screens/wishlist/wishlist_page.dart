import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common_widgets/appbar/custom_appbar.dart';
import '../../bloc/wishlist_bloc/wishlist_bloc.dart';
import 'widgets/wishlist_card.dart';
import 'widgets/wishlist_loader.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<WishlistBloc>(context).add(GetWishlistEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const CustomAppBar(title: 'Wishlist'),
          BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
            switch (state.status) {
              case WishlistStatus.initial:
              case WishlistStatus.loading:
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return const WishlistLoader();
                  },
                );
              case WishlistStatus.error:
                return Center(child: Text(state.errorMsg!));
              case WishlistStatus.loaded:
                final carts = state.wishlist!.wishlist;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: carts.length,
                  itemBuilder: (context, index) {
                    return WishlistCard(item: carts[index]);
                  },
                );
            }
          }),
        ],
      ),
    ));
  }
}
