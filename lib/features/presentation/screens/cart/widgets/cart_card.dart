import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../domain/entities/cart/cart_response_entity.dart';
import '../../../utils/display_in_rupees.dart';
import '../../../utils/price_with_discount.dart';

class CartCard extends StatefulWidget {
  final Cart item;
  const CartCard({super.key, required this.item});

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isDarkTheme ? const Color(0xFF232323) : Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image carousel with fixed constraints
            SizedBox(
              width: media.width * 0.2, // Fixed width for carousel
              child: CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: false,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  autoPlayCurve: Curves.easeInCubic,
                  enableInfiniteScroll: widget.item.productId.image.length > 1,
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: widget.item.productId.image.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imageUrl,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            color: Colors.grey[300],
                            child: const Icon(
                              Icons.image_not_supported,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),

            // Spacing
            SizedBox(width: media.width * 0.03),

            // Product details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.item.productId.name,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          displayPriceInRupees(priceWithDiscount(
                            widget.item.productId.variants[0].price,
                            widget.item.productId.variants[0].discount,
                          )),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppLightColor.primary,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          displayPriceInRupees(
                              widget.item.productId.variants[0].price),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
