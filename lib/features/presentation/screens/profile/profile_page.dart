import 'package:flutter/material.dart';
import '../../../common_widgets/appbar/custom_appbar.dart';
import '../../../common_widgets/profile_widget/profile_option.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                  padding: EdgeInsets.all(10),
                  children: [
                    CustomAppBar(title: 'Profile'),
                    SizedBox(
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
                      icon: Icons.logout,
                      title: 'Logout',
                      onTap: () {
                        // authController.logoutController();
                        // Get.offAll(WelcomePage());
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
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
