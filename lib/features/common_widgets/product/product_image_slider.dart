import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/constants/app_colors.dart';

class ProductImageSlider extends StatefulWidget {
  final List<String> imageUrls;
  const ProductImageSlider({
    Key? key,
    required this.imageUrls,
  }) : super(key: key);

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: media.height / 2.2,
            enlargeCenterPage: true,
            autoPlay: false,
            viewportFraction: 1.0,
            autoPlayCurve: Curves.easeInCubic,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.imageUrls.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    width: media.width,
                    fit: BoxFit.fitWidth,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.image_not_supported),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 5),
        AnimatedSmoothIndicator(
          activeIndex: _currentIndex,
          count: widget.imageUrls.length,
          effect: WormEffect(
            paintStyle: PaintingStyle.fill,
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: AppLightColor.primary,
            dotColor: Colors.grey,
          ),
        ),
      ],
    );
  }
}
