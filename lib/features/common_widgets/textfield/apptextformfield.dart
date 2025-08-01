import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Color? bgColor;
  final Widget? left;
  final Widget? right;
  final String? Function(String?)? validator;

  const AppTextFormField({
    Key? key,
    this.controller,
    required this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.bgColor,
    this.left,
    this.right,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return TextFormField(
      obscureText: obscureText,
      autocorrect: false,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        filled: true,
        fillColor: bgColor ??
            (isDarkTheme
                ? const Color.fromARGB(255, 50, 50, 50)
                : const Color.fromARGB(255, 213, 213, 213)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none, // No border, but allows error to show
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.blue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppLightColor.placeholder,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: left,
        suffixIcon: right,
      ),
    );
  }
}
