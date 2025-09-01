import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thilagas_recipe/features/common_widgets/buttons/long_btn.dart';
import 'package:thilagas_recipe/features/presentation/screens/auth/login_page.dart';

class AskLogin extends StatelessWidget {
  final String data;
  const AskLogin({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: media.height / 10,
        ),
        Image.asset(
          'assets/images/nothing_here_yet.webp', // Make sure this image exists in your assets folder
          width: media.width, // Adjust size as needed
        ),
        const SizedBox(height: 10),
        Text(
          data,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        LongBtn(
            onPressed: () {
              Get.to(const Loginpage());
            },
            title: 'Login Now',
            fontSize: 17)
      ],
    );
  }
}
