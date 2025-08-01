import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../common_widgets/buttons/long_btn.dart';
import 'login_page.dart';
import 'onboarding_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: media.height / 5,
            ),
            Container(
              width: media.width / 3,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(140),
                color: Colors.white,
              ),
              child: Image.asset(
                'assets/images/thilaga.png',
              ),
            ),
            SizedBox(
              height: media.height / 20,
            ),
            Text(
              'Market',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: isDarkTheme
                    ? AppDarkColor.primaryText
                    : AppLightColor.primaryText,
              ),
            ),
            Container(
              padding: EdgeInsets.all(40),
              child: Text(
                'Beautiful Ecommerce online store for your daily needs.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: media.height / 20,
            ),
            LongBtn(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OnBoardingPage()));
                },
                title: "Lets get Started",
                fontSize: 20),
            SizedBox(
              height: media.height / 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'I already have an account',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  width: media.width / 50,
                ),
                Container(
                    height: media.height / 20,
                    width: media.width / 9,
                    decoration: BoxDecoration(
                        color: AppLightColor.primary,
                        borderRadius: BorderRadius.circular(30)),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Loginpage()));
                        },
                        icon: Icon(
                          Icons.chevron_right,
                          size: 25,
                          color: isDarkTheme
                              ? AppDarkColor.primaryText
                              : AppLightColor.primaryText,
                        )))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
