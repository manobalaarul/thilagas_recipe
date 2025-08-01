import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

enum RoundButtonType { bgPrimary, textPrimary }

class LongBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double fontSize;
  final RoundButtonType type;
  const LongBtn({
    Key? key,
    required this.onPressed,
    required this.title,
    this.type = RoundButtonType.bgPrimary,
    required this.fontSize,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onPressed,
      child: Container(
        height: 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: type == RoundButtonType.bgPrimary
              ? null
              : Border.all(color: AppLightColor.primary, width: 2),
          color: type == RoundButtonType.bgPrimary
              ? AppLightColor.primary
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: type == RoundButtonType.bgPrimary
                  ? Colors.white
                  : AppLightColor.primary,
              fontSize: fontSize,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
