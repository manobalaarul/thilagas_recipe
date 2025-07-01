import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class OfferLoader extends StatelessWidget {
  const OfferLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    var media = MediaQuery.of(context).size;

    return SizedBox(
      height: media.height / 6,
      width: media.width,
      child: Shimmer.fromColors(
        baseColor: isDarkTheme ? Color(0xFF232323) : Colors.grey[300]!,
        highlightColor: isDarkTheme ? Color(0xFF232323) : Colors.grey[100]!,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: media.width,
            height: media.height / 6,
            color: isDarkTheme ? Color(0xFF232323) : Colors.white,
          ),
        ),
      ),
    );
  }
}
