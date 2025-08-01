import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoItem extends StatelessWidget {
  const NoItem({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Center(
      // Wrap in a Center widget to properly display
      child: LottieBuilder.asset(
        'assets/images/animation/no_item.json',
        width: media.width, // Adjust size if needed
        height: media.height / 1.5,
      ),
    );
  }
}
