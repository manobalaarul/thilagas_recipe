import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../utils/display_in_rupees.dart';
import '../../../utils/path_to_url.dart';

class OrderProductCard extends StatelessWidget {
  final OrderModel item;
  const OrderProductCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
          itemCount: item.products.length,
          itemBuilder: (context, index) {
            var product = item.products[index];
            return Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: isDarkTheme ? Color(0xFF232323) : Colors.white,
                  borderRadius: BorderRadius.circular(7)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: Image.network(
                          pathToUrl(product.productDetails.image),
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
                            product.productDetails.name,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Items -",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                product.qty.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    displayPriceInRupees(product.price),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppLightColor.primary,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
