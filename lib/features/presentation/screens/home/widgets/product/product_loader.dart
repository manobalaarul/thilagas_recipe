import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductLoader extends StatelessWidget {
  const ProductLoader({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: media.width / 2.5,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isDarkTheme ? const Color(0xFF232323) : Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Shimmer.fromColors(
        baseColor: isDarkTheme ? const Color(0xFF2c2c2c) : Colors.grey[300]!,
        highlightColor: isDarkTheme ? const Color(0xFF3a3a3a) : Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Placeholder
            Container(
              width: media.width / 2.3,
              height: media.width / 2.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(height: 10),

            // Product Name Placeholder
            Container(
              width: media.width / 3.2,
              height: 14,
              color: Colors.white,
            ),
            const SizedBox(height: 5),

            // Price Row Placeholder
            Row(
              children: [
                Container(
                  width: media.width / 6,
                  height: 16,
                  color: Colors.white,
                ),
                const SizedBox(width: 5),
                Container(
                  width: media.width / 8,
                  height: 14,
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 5),

            // Optional Action Buttons Placeholder
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Container(width: 40, height: 20, color: Colors.white),
            //     Container(width: 20, height: 20, color: Colors.white),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
