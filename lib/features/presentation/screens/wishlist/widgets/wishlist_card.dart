import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../domain/entities/wishlist/get/wishlist_response_entity.dart';
import '../../../utils/display_in_rupees.dart';
import '../../../utils/price_with_discount.dart';
import 'add_to_wishlist_btn.dart';

class WishlistCard extends StatefulWidget {
  final Wishlist item;
  const WishlistCard({
    super.key,
    required this.item,
  });

  @override
  State<WishlistCard> createState() => _WishlistCardState();
}

class _WishlistCardState extends State<WishlistCard> {
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
          borderRadius: BorderRadius.circular(7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: media.width * 0.3, // Fixed width for carousel
                child: CarouselSlider(
                  options: CarouselOptions(
                    enlargeCenterPage: false,
                    autoPlay: true,
                    viewportFraction: 1.0,
                    autoPlayCurve: Curves.easeInCubic,
                    enableInfiniteScroll:
                        widget.item.productId.image.length > 1,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 1000),
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
              SizedBox(width: media.width * 0.01),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.productId.name,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        displayPriceInRupees(priceWithDiscount(
                            widget.item.productId.variants[0].price,
                            widget.item.productId.variants[0].discount)),
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
            ],
          ),
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: AddToWishlistBtn(productId: widget.item.productId.id)),
        ],
      ),
    );
  }
}
