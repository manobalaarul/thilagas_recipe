import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/app_colors.dart';
import '../home/home_page.dart';

class MainTab extends StatefulWidget {
  const MainTab({super.key});

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final media = MediaQuery.of(context).size;

    return Scaffold(
      body: PopScope(
        canPop: false, // Prevents auto pop
        onPopInvoked: (didPop) {
          if (didPop) return;
          _showExitConfirmation(context);
        },
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor:
            isDarkTheme ? AppDarkColor.background : AppLightColor.background,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType
            .fixed, // Ensures icons and labels remain visible
        selectedItemColor: Colors.blue, // Selected item color
        unselectedItemColor: Colors.grey, // Unselected item color
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              width: media.width / 10,
              height: media.height / 40,
              'assets/images/icons/home.png',
              color: _currentIndex == 0
                  ? AppDarkColor.primary
                  : AppLightColor.primaryText,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              width: media.width / 10,
              height: media.height / 40,
              'assets/images/icons/wishlist.png',
              color: _currentIndex == 1
                  ? AppDarkColor.primary
                  : AppLightColor.primaryText,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              width: media.width / 10,
              height: media.height / 40,
              'assets/images/icons/cart.png',
              color: _currentIndex == 2
                  ? AppDarkColor.primary
                  : AppLightColor.primaryText,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              width: media.width / 10,
              height: media.height / 40,
              'assets/images/icons/user.png',
              color: _currentIndex == 3
                  ? AppDarkColor.primary
                  : AppLightColor.primaryText,
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  void _showExitConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text("Exit App"),
        content: Text("Are you sure you want to exit?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () => {SystemNavigator.pop()}, // Close the app
            child: Text("Exit"),
          ),
        ],
      ),
    );
  }
}
