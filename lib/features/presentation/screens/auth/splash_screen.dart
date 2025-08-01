import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void loginCheck() async {
    await Future.delayed(const Duration(seconds: 2));
    final prefs = await SharedPreferences.getInstance();
    String? val = await prefs.getString('accessToken');
    if (val != null) {
      // Get.offAll(() => MainPage());
    } else {
      // Get.offAll(() => WelcomePage());
    }
  }

  @override
  void initState() {
    loginCheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: media.width / 2,
              child: CircleAvatar(
                maxRadius: media.width / 2,
                backgroundColor: Colors.white,
                child: Image.asset(
                  "assets/images/thilaga.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
                width: media.width / 10,
                child: LoadingAnimationWidget.threeRotatingDots(
                    color: AppLightColor.primary, size: 30))
          ],
        ),
      ),
    );
  }
}
