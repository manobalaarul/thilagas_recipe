import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../common_widgets/buttons/long_btn.dart';

class OtpVerifyPage extends StatefulWidget {
  const OtpVerifyPage({super.key, required this.email});
  final String email;
  @override
  State<OtpVerifyPage> createState() => _OtpVerifyPageState();
}

class _OtpVerifyPageState extends State<OtpVerifyPage> {
  final TextEditingController _otpController = TextEditingController();
  bool loading = false;

  void sendOtp() async {
    // if (widget.email != "") {
    //   authController.sendOtp(widget.email);
    // }
  }

  @override
  void initState() {
    sendOtp();
    super.initState();
  }

  void verifyPassword() async {
    setState(() {
      loading = true;
    });

    if (_otpController.text != "") {
      // try {
      //   Map<String, dynamic>? response = await authController.verifyPassword(
      //       widget.email, _otpController.text);

      //   if (response != null && response["success"] == true) {
      //     print("Signup successful: ${response["message"]}");
      //     Get.to(ResetPassword(
      //       email: widget.email,
      //     ));
      //   } else {
      //     print("Signup failed: ${response?["message"] ?? "Unknown error"}");
      //   }
      // } catch (e) {
      //   print("Error: $e");
      // } finally {
      //   setState(() {
      //     loading = false;
      //   });
      // }
    } else {
      // Get.snackbar("Error", "Enter otp to continue");
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final media = MediaQuery.of(context).size;

    return Stack(
      children: [
        Scaffold(
          body: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus
                  ?.unfocus(); // Unfocus text field
            },
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/Bubbles2.png',
                    width: media.width,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: media.height / 2),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Hello',
                              style: TextStyle(
                                  color: isDarkTheme
                                      ? AppDarkColor.primaryText
                                      : AppLightColor.primaryText,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Enter 6 digits code we sent you on your email address',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: isDarkTheme
                                    ? AppDarkColor.primaryText
                                    : AppLightColor.primaryText,
                                fontSize: 17,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: media.height / 20),
                        Pinput(
                          controller: _otpController,
                          length: 6,
                          keyboardType: TextInputType.number,
                          onCompleted: (pin) => print("Entered pin is: $pin"),
                          onChanged: (pin) => print("Changed pin: $pin"),
                          defaultPinTheme: PinTheme(
                            width: media.width / 7,
                            height: media.height / 13,
                            textStyle: TextStyle(
                              fontSize: 20,
                              color: isDarkTheme
                                  ? AppDarkColor.primaryText
                                  : AppLightColor.primaryText,
                            ),
                            decoration: BoxDecoration(
                              color: isDarkTheme
                                  ? Color.fromARGB(255, 50, 50, 50)
                                  : Color.fromARGB(255, 213, 213, 213),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.transparent),
                            ),
                          ),
                          focusedPinTheme: PinTheme(
                            width: media.width / 7,
                            height: media.height / 13,
                            textStyle: TextStyle(
                              fontSize: 20,
                              color: isDarkTheme
                                  ? AppDarkColor.primaryText
                                  : AppLightColor.primaryText,
                            ),
                            decoration: BoxDecoration(
                              color: isDarkTheme
                                  ? Color.fromARGB(255, 70, 70, 70)
                                  : Color.fromARGB(255, 233, 233, 233),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.blueAccent),
                            ),
                          ),
                        ),
                        SizedBox(height: media.height / 50),
                        LongBtn(
                          onPressed: () {
                            // Handle OTP verification logic
                            verifyPassword();
                          },
                          title: "Next",
                          fontSize: 20,
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (loading)
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (loading)
          Center(
            child: LoadingAnimationWidget.fourRotatingDots(
                color: Colors.white, size: 40),
          ),
      ],
    );
  }
}
