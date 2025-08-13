import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../bloc/login_check_bloc/logincheck_bloc.dart';
import '../../../bloc/wishlist_bloc/wishlist_bloc.dart';

class AddToWishlistBtn extends StatefulWidget {
  final String productId;

  const AddToWishlistBtn({super.key, required this.productId});

  @override
  State<AddToWishlistBtn> createState() => _AddToWishlistBtnState();
}

class _AddToWishlistBtnState extends State<AddToWishlistBtn> {
  bool loading = false;
  bool? localWishlistState; // null = not overridden

  Future<void> handleAddToWishlistBtn(BuildContext context) async {
    setState(() {
      loading = true;
      localWishlistState = true;
    });
    context.read<WishlistBloc>().add(AddToWishlistEvent(id: widget.productId));
    setState(() => loading = false);
    context.read<WishlistBloc>().add(GetWishlistEvent());
  }

  Future<void> handleRemoveFromWishlist(BuildContext context) async {
    setState(() {
      loading = true;
      localWishlistState = false;
    });
    context
        .read<WishlistBloc>()
        .add(RemoveFromWishlistEvent(id: widget.productId));
    setState(() => loading = false);
    context.read<WishlistBloc>().add(GetWishlistEvent());
  }

  void showLoginToast() {
    Fluttertoast.showToast(
      msg: "Please log in to manage your wishlist",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogincheckBloc, LogincheckState>(
      builder: (context, loginState) {
        return BlocBuilder<WishlistBloc, WishlistState>(
          builder: (context, wishlistState) {
            final isInWishlist = localWishlistState ??
                (wishlistState.wishlist?.wishlist
                        .any((item) => item.productId.id == widget.productId) ??
                    false);

            if (isInWishlist) {
              return InkWell(
                onTap: () {
                  if (loginState.status == LogincheckStatus.unauthenticated) {
                    showLoginToast();
                    return;
                  }
                  handleRemoveFromWishlist(context);
                },
                child: loading
                    ? const SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Icon(Icons.favorite_rounded,
                        color: AppLightColor.primary),
              );
            } else {
              return InkWell(
                onTap: () {
                  if (loginState.status == LogincheckStatus.unauthenticated) {
                    showLoginToast();
                    return;
                  }
                  handleAddToWishlistBtn(context);
                },
                child: loading
                    ? const SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Icon(Icons.favorite_border_rounded,
                        color: AppLightColor.primary),
              );
            }
          },
        );
      },
    );
  }
}
