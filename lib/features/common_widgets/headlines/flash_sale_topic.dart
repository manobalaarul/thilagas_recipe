import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../../../core/constants/app_colors.dart';

class FlashSaleTopic extends StatelessWidget {
  final String title;
  const FlashSaleTopic({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    var media = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {},
          child: Row(
            children: [
              Icon(
                Icons.timer,
                size: 25,
                color: AppDarkColor.primaryText,
              ),
              SizedBox(
                width: media.width / 40,
              ),
              SlideCountdownSeparated(
                duration: Duration(hours: 2),
                decoration: BoxDecoration(
                    color: AppDarkColor.primary,
                    borderRadius: BorderRadius.circular(5)),
              )
            ],
          ),
        )
      ],
    );
  }
}
