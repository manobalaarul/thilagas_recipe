import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../domain/entities/product/product_response_entity.dart';
import '../../presentation/screens/product/product_view.dart';
import '../../presentation/screens/wishlist/widgets/add_to_wishlist_btn.dart';
import '../../presentation/utils/display_in_rupees.dart';
import '../../presentation/utils/price_with_discount.dart';
import '../../utils/helper/path_to_url.dart';
import '../cart/add_to_cart_btn.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductView(product: product)));
      },
      child: Container(
        width: media.width / 2.5,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isDarkTheme ? const Color(0xFF232323) : Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: Image.network(
                pathToUrl(product.image[0]),
                width: media.width / 2.3,
                height: media.width / 2.5,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),

            // Product Name
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),

            // Price Row
            Row(
              children: [
                Text(
                  displayPriceInRupees(priceWithDiscount(
                      product.variants[0].price, product.variants[0].discount)),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppLightColor.primary,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  displayPriceInRupees(product.variants[0].price),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            // Action Icons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AddToCartBtn(
                    productId: product.id,
                    variant: product.variants[0],
                    design: false,
                  ),
                  AddToWishlistBtn(productId: product.id)
                ],
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
