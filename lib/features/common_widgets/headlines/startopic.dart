import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class Startopic extends StatelessWidget {
  final String title;
  const Startopic({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          width: media.width / 100,
        ),
        Icon(
          Icons.star,
          color: AppDarkColor.primary,
          size: 20,
        )
      ],
    );
  }
}
