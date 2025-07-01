import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: "JosefinSans",
  brightness: Brightness.light,
  primaryColor: Color(0xFFf7f5eb),
  scaffoldBackgroundColor: Color(0xFFeff6ff),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFf7f5eb),
    foregroundColor: Colors.black,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
);
