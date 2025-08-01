import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../common_widgets/buttons/long_btn.dart';
import '../../../common_widgets/textfield/apptextformfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  bool passvisible = true;
  bool conPassvisible = true;
  bool loading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conPasswordController = TextEditingController();

  void signupFunc() async {
    setState(() {
      loading = true;
    });

    if (_formKey.currentState!.validate()) {
      // try {
      //   Map<String, dynamic>? response = await authController.signupController(
      //     nameController.text,
      //     emailController.text,
      //     passwordController.text,
      //   );

      //   if (response != null && response["success"] == true) {
      //     print("Signup successful: ${response["message"]}");
      //     Get.to(Loginpage());
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
      print("Form is invalid");
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
                    'assets/images/Bubbles.png',
                    width: media.width,
                    fit: BoxFit.fill,
                  ),
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUnfocus,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: media.height / 5,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Create',
                                  style: TextStyle(
                                      color: isDarkTheme
                                          ? AppDarkColor.primaryText
                                          : AppLightColor.primaryText,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Account',
                                  style: TextStyle(
                                      color: isDarkTheme
                                          ? AppDarkColor.primaryText
                                          : AppLightColor.primaryText,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: media.height / 20,
                          ),
                          AppTextFormField(
                            hintText: "Name",
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: media.height / 50,
                          ),
                          AppTextFormField(
                            hintText: "Email",
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: media.height / 50,
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
                            height: media.height / 50,
                          ),
                          LongBtn(
                            onPressed: () {
                              signupFunc();
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
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          )
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
