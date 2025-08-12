import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WishlistLoader extends StatelessWidget {
  const WishlistLoader({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isDarkTheme ? const Color(0xFF232323) : Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Shimmer.fromColors(
        baseColor: isDarkTheme ? const Color(0xFF2c2c2c) : Colors.grey[300]!,
        highlightColor:
            isDarkTheme ? const Color(0xFF3a3a3a) : Colors.grey[100]!,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image Placeholder (matching CarouselSlider dimensions)
              Container(
                width: media.width * 0.4,
                height: media.height / 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              // Spacing
              SizedBox(width: media.width * 0.03),

              // Product details placeholder
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Product Name Placeholder (2 lines)
                      Container(
                        width: double.infinity,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: media.width * 0.3,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Price Row Placeholder
                      Row(
                        children: [
                          // Discounted price
                          Container(
                            width: media.width * 0.15,
                            height: 18,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Original price
                          Container(
                            width: media.width * 0.12,
                            height: 14,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
