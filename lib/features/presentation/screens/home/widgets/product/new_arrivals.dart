import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../common_widgets/product/product_card.dart';
import '../../../../../domain/entities/product/product_response_entity.dart';

class NewArrivals extends StatelessWidget {
  final List<Product> products;
  const NewArrivals({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Wrap(
      spacing: media.width / 30, // Horizontal spacing
      runSpacing: media.height / 50, // Vertical spacing
      alignment: WrapAlignment.center, // Center align the items
      children: products.map((product) {
        return SizedBox(
          width: media.width / 2.2, // Each item takes ~half of the row
          child: ProductCard(product: product),
        );
      }).toList(),
    );
  }

  // ✅ Shimmer Effect Widget
}
