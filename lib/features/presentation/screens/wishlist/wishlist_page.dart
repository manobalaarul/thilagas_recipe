import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common_widgets/appbar/custom_appbar.dart';
import '../../../common_widgets/design/ask_login.dart';
import '../../../common_widgets/design/no_data.dart';
import '../../bloc/login_check_bloc/logincheck_bloc.dart';
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
          BlocBuilder<LogincheckBloc, LogincheckState>(
              builder: (context, state) {
            switch (state.status) {
              case LogincheckStatus.checking:
              case LogincheckStatus.authenticated:
                return BlocBuilder<WishlistBloc, WishlistState>(
                    builder: (context, state) {
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
                      final wishlists = state.wishlist?.wishlist ?? [];

                      if (wishlists.isEmpty) {
                        return const Center(
                            child: NoData(data: "Your wishlist is empty"));
                      }

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: wishlists.length,
                        itemBuilder: (context, index) {
                          return WishlistCard(item: wishlists[index]);
                        },
                      );
                  }
                });
              case LogincheckStatus.unauthenticated:
                return const Center(
                    child: AskLogin(data: "Please login to check wishlist!"));
            }
          })
        ],
      ),
    ));
  }
}
