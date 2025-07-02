import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryLoader extends StatelessWidget {
  const CategoryLoader({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: media.height / 6,
      child: Shimmer.fromColors(
        baseColor: isDarkTheme ? Color(0xFF232323) : Colors.grey[300]!,
        highlightColor: isDarkTheme ? Color(0xFF232323) : Colors.grey[100]!,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: media.width / 3,
                  height: media.height / 10,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: isDarkTheme ? Color(0xFF232323) : Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: media.width / 3,
                  height: media.height / 40,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: isDarkTheme ? Color(0xFF232323) : Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
