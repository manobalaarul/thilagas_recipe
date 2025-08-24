import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../common_widgets/appbar/custom_appbar.dart';
import '../../../common_widgets/product/product_image_slider.dart';
import '../../../domain/entities/product/product_entity.dart';
import '../../utils/display_in_rupees.dart';
import '../../utils/price_with_discount.dart';

class ProductView extends StatefulWidget {
  final Product product;
  const ProductView({
    super.key,
    required this.product,
  });

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    String cleanedHtml = widget.product.description
        .replaceAll("<br>", ""); // normalize self-closing format
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: [
                  CustomAppBar(
                    title: widget.product.name,
                    needBack: true,
                  ),
                  ProductImageSlider(imageUrls: widget.product.image),
                  SizedBox(height: media.height / 90),
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: media.height / 90),
                  Row(
                    children: [
                      Text(
                        displayPriceInRupees(priceWithDiscount(
                            widget.product.variants[0].price,
                            widget.product.variants[0].discount)),
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                          color: AppLightColor.primary,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        displayPriceInRupees(widget.product.variants[0].price),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: media.height / 90),
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  SizedBox(height: media.height / 90),
                  Html(
                    style: {
                      "p": Style(
                        fontSize: FontSize(16.0), // Specific for paragraph tags
                      ),
                    },
                    data: cleanedHtml,
                  ),
                  SizedBox(height: media.height / 90),

                  // **Display More Details**
                  if (widget.product.moreDetails != null) ...[
                    const Text(
                      "More Details",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const Divider(),
                    const SizedBox(height: 5),
                    ...widget.product.moreDetails!.entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Container(
                          padding:
                              const EdgeInsets.all(8), // Padding inside the box
                          child: (entry.value.toString().length > 20)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      entry.key,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    const Divider(), // Adds a line between key and value
                                    Text(
                                      entry.value.toString(),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      entry.key,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      entry.value.toString(),
                                      overflow: TextOverflow
                                          .ellipsis, // Avoids overflow in row mode
                                    ),
                                  ],
                                ),
                        ),
                      );
                    }),
                    SizedBox(height: media.height / 90),
                  ],
                ],
              ),
            ),
            // Add to Cart button at the bottom
            // Container(
            //   width: double.infinity,
            //   padding: const EdgeInsets.all(10),
            //   color: Colors.white, // Optional: Background color for visibility
            //   child: AddToCartBtn(
            //     product: widget.product,
            //     design: true,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
