import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Wrap(
      spacing: media.width / 40, // Horizontal spacing
      runSpacing: media.height / 50, // Vertical spacing
      alignment: WrapAlignment.start,
      children: List.generate(8, (index) {
        // Show 6 shimmer placeholders
        return SizedBox(
          width: media.width / 2.2, // Same size as product card
          child: Shimmer.fromColors(
            baseColor: isDarkTheme ? Color(0xFF232323) : Colors.grey[300]!,
            highlightColor: isDarkTheme ? Color(0xFF232323) : Colors.grey[100]!,
            child: Column(
              children: [
                Container(
                  height: 150, // Approximate height of product card
                  width: media.width / 2.2,
                  decoration: BoxDecoration(
                    color: isDarkTheme ? Color(0xFF232323) : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 20, // Approximate height of product card
                  width: media.width / 2.2,
                  decoration: BoxDecoration(
                    color: isDarkTheme ? Color(0xFF232323) : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
