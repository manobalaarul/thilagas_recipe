import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../domain/entities/offers/offer_response_entity.dart';
import '../../bloc/offer_bloc/offer_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OfferWidget extends StatefulWidget {
  final OfferState state;
  final OfferResponseEntity offers;
  const OfferWidget({super.key, required this.state, required this.offers});

  @override
  State<OfferWidget> createState() => _OfferWidgetState();
}

class _OfferWidgetState extends State<OfferWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    List<String> imageUrls = [
      widget.offers.offer.image1,
      widget.offers.offer.image2,
      widget.offers.offer.image3,
    ];

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: media.height / 6,
            enlargeCenterPage: true,
            autoPlay: true,
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
          items: imageUrls.map((imageUrl) {
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
        const SizedBox(height: 10),
        AnimatedSmoothIndicator(
          activeIndex: _currentIndex,
          count: imageUrls.length,
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
