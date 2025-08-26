import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';

import '../../../../../domain/entities/order/order_response_entity.dart';
import '../../../../../utils/helper/path_to_url.dart';

class OrderImageSlider extends StatelessWidget {
  final Order item;
  const OrderImageSlider({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.centerLeft,
      child: CarouselSlider(
        options: CarouselOptions(
          height: media.width / 4.5,
          viewportFraction: 1.0,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          enlargeCenterPage: true,
        ),
        items: item.products.map((product) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              pathToUrl(product.productDetails.image),
              width: media.width / 4,
              height: media.width / 5,
              fit: BoxFit.cover,
            ),
          );
        }).toList(),
      ),
    );
  }
}
