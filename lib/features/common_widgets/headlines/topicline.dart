import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';


class TopicLine extends StatelessWidget {
  final String title;
  final bool showBtn;
  final VoidCallback? onTap;

  const TopicLine({
    Key? key,
    required this.title,
    this.showBtn = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(top: 5),
          child: Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        showBtn
            ? InkWell(
                splashColor: Colors.transparent,
                onTap: onTap,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        'See all',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(width: media.width / 50),
                    Container(
                      height: 20,
                      width: 20,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppDarkColor.primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 14,
                        color: AppDarkColor.primaryText,
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
      ],
    );
  }
}
