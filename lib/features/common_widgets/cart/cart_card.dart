import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../domain/entities/cart/cart_response_entity.dart';
import '../../presentation/utils/display_in_rupees.dart';
import '../../presentation/utils/price_with_discount.dart';
import '../../utils/helper/path_to_url.dart';

class CartCard extends StatelessWidget {
  final Cart item;
  const CartCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: isDarkTheme ? const Color(0xFF232323) : Colors.white,
          borderRadius: BorderRadius.circular(7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Image.network(
                  pathToUrl(item.productId.image[0]),
                  width: media.width / 4,
                  height: media.width / 5,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: media.width / 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.productId.name,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        displayPriceInRupees(priceWithDiscount(
                            item.productId.variants[0].price,
                            item.productId.variants[0].discount)),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppLightColor.primary,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        displayPriceInRupees(item.productId.variants[0].price),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // AddToCartBtn(
          //   product: item.product,
          //   design: false,
          // )
        ],
      ),
    );
  }
}
