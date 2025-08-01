import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../common_widgets/buttons/long_btn.dart';
import '../../../common_widgets/textfield/apptextformfield.dart';

class ResetPassword extends StatefulWidget {
  final String email;
  const ResetPassword({super.key, required this.email});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool passvisible = true;
  bool conPassvisible = true;
  bool loading = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController conPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final media = MediaQuery.of(context).size;

    void savePassword() async {
      setState(() {
        loading = true;
      });
      log('message');
      if (_formKey.currentState!.validate()) {
        // try {
        //   Map<String, dynamic>? response = await authController.savePassword(
        //       widget.email,
        //       passwordController.text,
        //       conPasswordController.text);

        //   if (response != null && response["success"] == true) {
        //     print("Password changed successfully: ${response["message"]}");
        //     Get.offAll(Loginpage());
        //   } else {
        //     print(
        //         "Password change failed: ${response?["message"] ?? "Unknown error"}");
        //   }
        // } catch (e) {
        //   print("Error: $e");
        // } finally {
        //   setState(() {
        //     loading = false;
        //   });
        // }
      } else {
        setState(() {
          loading = false;
        });
      }
    }

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
                    'assets/images/Bubbles3.png',
                    width: media.width,
                    fit: BoxFit.fill,
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: media.height / 5,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: isDarkTheme
                                    ? AppDarkColor.primaryText
                                    : AppLightColor.primaryText,
                                borderRadius: BorderRadius.circular(50)),
                            child: CircleAvatar(
                              backgroundColor: isDarkTheme
                                  ? AppDarkColor.primaryText
                                  : AppLightColor.primaryText,
                              radius: 40,
                              backgroundImage:
                                  AssetImage('assets/images/artist.png'),
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Setup New Password',
                                  style: TextStyle(
                                      color: isDarkTheme
                                          ? AppDarkColor.primaryText
                                          : AppLightColor.primaryText,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: media.height / 60,
                                ),
                                Text(
                                  'Please, setup a new password for your account',
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
                          ),
                          SizedBox(
                            height: media.height / 20,
                          ),
                          AppTextFormField(
                            hintText: "Password",
                            controller: passwordController,
                            obscureText: passvisible,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null;
                            },
                            right: IconButton(
                              icon: Icon(
                                passvisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  passvisible = !passvisible;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: media.height / 50,
                          ),
                          AppTextFormField(
                            hintText: "Confirm Password",
                            controller: conPasswordController,
                            obscureText: conPassvisible,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              } else if (value != passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                            right: IconButton(
                              icon: Icon(
                                conPassvisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  conPassvisible = !conPassvisible;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: media.height / 7,
                          ),
                          LongBtn(
                              onPressed: () {
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) => OtpPage()));
                                savePassword();
                              },
                              title: "Save",
                              fontSize: 20),
                        ],
                      ),
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
