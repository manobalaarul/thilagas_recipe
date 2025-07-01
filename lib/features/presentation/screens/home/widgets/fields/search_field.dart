import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_colors.dart';

class SearchField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Color? bgColor;
  final Widget? right;
  final bool readOnly;
  final VoidCallback? onTap;
  final Function(String)? onChanged; // ✅ Fix: Use Function(String)

  const SearchField({
    Key? key,
    this.controller,
    required this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.bgColor,
    this.right,
    required this.readOnly,
    this.onTap,
    this.onChanged, // ✅ Fix: Add space
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    var media = MediaQuery.of(context).size;
    return Container(
      width: media.width / 1.7,
      decoration: BoxDecoration(
          color: isDarkTheme
              ? Color.fromARGB(255, 50, 50, 50)
              : Color.fromARGB(255, 213, 213, 213),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: onChanged, // ✅ Fix: Now properly accepts a String
              onTap: onTap,
              readOnly: readOnly,
              obscureText: obscureText,
              autocorrect: false,
              controller: controller,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                      color: AppLightColor.placeholder,
                      fontSize: 15,
                      fontWeight: FontWeight.w500)),
            ),
          ),
          if (right != null)
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: right!,
            ),
        ],
      ),
    );
  }
}
