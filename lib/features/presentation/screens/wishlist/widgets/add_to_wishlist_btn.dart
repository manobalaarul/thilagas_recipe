import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../bloc/wishlist_bloc/wishlist_bloc.dart';

class AddToWishlistBtn extends StatefulWidget {
  final String productId;

  const AddToWishlistBtn({super.key, required this.productId});

  @override
  State<AddToWishlistBtn> createState() => _AddToWishlistBtnState();
}

class _AddToWishlistBtnState extends State<AddToWishlistBtn> {
  bool loading = false;

  Future<void> handleAddToWishlistBtn(BuildContext context) async {
    setState(() => loading = true);
    context.read<WishlistBloc>().add(AddToWishlistEvent(id: widget.productId));
    setState(() => loading = false);
  }

  Future<void> handleRemoveFromWishlist(BuildContext context) async {
    setState(() => loading = true);
    context
        .read<WishlistBloc>()
        .add(RemoveFromWishlistEvent(id: widget.productId));
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (context, state) {
        final isInWishlist = state.wishlist?.wishlist
                .any((item) => item.productId.id == widget.productId) ??
            false;

        if (isInWishlist) {
          return InkWell(
            onTap: () => handleRemoveFromWishlist(context),
            child: loading
                ? const SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Icon(Icons.favorite_rounded, color: AppLightColor.primary),
          );
        } else {
          return InkWell(
            onTap: () => handleAddToWishlistBtn(context),
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
  }
}
