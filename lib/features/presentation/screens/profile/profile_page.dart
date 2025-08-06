import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thilagas_recipe/core/constants/app_constants.dart';
import 'package:thilagas_recipe/features/presentation/screens/maintab/maintab.dart';
import 'package:thilagas_recipe/features/utils/helper/value_preferences.dart';

import '../../../common_widgets/appbar/custom_appbar.dart';
import '../../../common_widgets/profile_widget/profile_option.dart';
import '../auth/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    print(Prefs.getString(AppConstants.accessToken));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // Unfocus text field
        },
        child: SafeArea(
          child: Stack(
            children: [
              RefreshIndicator(
                onRefresh: () async {
                  // await Future.wait([globalController.fetchCompanyDetails()]);
                },
                child: ListView(
                  padding: const EdgeInsets.all(10),
                  children: [
                    const CustomAppBar(title: 'Profile'),
                    const SizedBox(
                      height: 10,
                    ),
                    ProfileOption(
                      icon: Icons.person,
                      title: 'Profile',
                      onTap: () {
                        // Get.to(() => UserDetails());
                      },
                    ),
                    ProfileOption(
                      icon: Icons.map,
                      title: 'Manage Address',
                      onTap: () {
                        // Get.to(() => MyAddress());
                      },
                    ),
                    ProfileOption(
                      icon: Icons.shopping_cart_rounded,
                      title: 'My Orders',
                      onTap: () {
                        // Get.to(() => MyOrders());
                      },
                    ),
                    ProfileOption(
                      icon: Icons.login,
                      title: Prefs.getString(AppConstants.accessToken) == ""
                          ? "Login / Sign up"
                          : "Logout",
                      onTap: () {
                        if (Prefs.getString(AppConstants.accessToken) == "") {
                          Get.to(const Loginpage());
                        } else {
                          Prefs.setString(AppConstants.accessToken, "");
                          Prefs.setString(AppConstants.refreshToken, "");
                          Prefs.setString(AppConstants.name, "");
                          Prefs.setString(AppConstants.email, "");
                          Get.offAll(const MainTab());
                        }
                      },
                    ),
                  ],
                ),
              ),
              const Positioned(
                  bottom: 20,
                  left: 10,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Developed by © '),
                      // Text(
                      //   // globalController.companyDetails.value!.name,
                      //   // style: TextStyle(color: AppLightColor.primary),
                      // ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
