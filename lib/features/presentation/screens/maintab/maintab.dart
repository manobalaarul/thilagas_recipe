import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thilagas_recipe/features/presentation/screens/wishlist/wishlist_page.dart';
import 'package:thilagas_recipe/features/presentation/utils/check_update.dart';

import '../../../../core/constants/app_colors.dart';
import '../../bloc/login_check_bloc/logincheck_bloc.dart';
import '../cart/cart_page.dart';
import '../home/home_page.dart';
import '../profile/profile_page.dart';

class MainTab extends StatefulWidget {
  const MainTab({super.key});

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const WishlistPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    UpdateChecker.checkForUpdate(context);
    // Dispatch event to check token
    context.read<LogincheckBloc>().add(CheckAuthStatus());
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final media = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocBuilder<LogincheckBloc, LogincheckState>(
        builder: (context, state) {
          return PopScope(
            canPop: false,
            onPopInvoked: (didPop) {
              if (didPop) return;
              _showExitConfirmation(context);
            },
            child: _pages[_currentIndex],
          );
        },
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
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
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
        title: const Text("Exit App"),
        content: const Text("Are you sure you want to exit?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () => SystemNavigator.pop(),
            child: const Text("Exit"),
          ),
        ],
      ),
    );
  }
}
