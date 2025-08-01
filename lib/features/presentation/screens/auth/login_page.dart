import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../common_widgets/buttons/long_btn.dart';
import '../../../common_widgets/textfield/apptextformfield.dart';
import 'otp_verify_page.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formKey = GlobalKey<FormState>();
  bool passvisible = true;
  bool loading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void loginFunc() async {
    setState(() {
      loading = true;
    });

    if (_formKey.currentState!.validate()) {
      // try {
      //   Map<String, dynamic>? response = await authController.loginController(
      //       emailController.text, passwordController.text);
      //   if (response != null && response["success"] == true) {
      //     print("Login successful: ${response["message"]}");
      //     DependencyInjection.init(); // Initialize dependencies
      //     Get.offAll(() => SplashScreen());
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

  void navigateOtp() {
    if (emailController.text != "") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OtpVerifyPage(
                    email: emailController.text,
                  )));
    } else {
      // Get.snackbar("Error", 'Enter email id to continue');
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
                    'assets/images/Bubbles1.png',
                    width: media.width,
                    height: media.height,
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
                            height: media.height / 2.3,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Login',
                                  style: TextStyle(
                                      color: isDarkTheme
                                          ? AppDarkColor.primaryText
                                          : AppLightColor.primaryText,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Good to see you back! ❤',
                                  style: TextStyle(
                                    color: isDarkTheme
                                        ? AppDarkColor.primaryText
                                        : AppLightColor.primaryText,
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: media.height / 20,
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
                          LongBtn(
                              onPressed: () {
                                loginFunc();
                              },
                              title: "Login",
                              fontSize: 20),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      navigateOtp();
                                    },
                                    child: Text(
                                      'Forgot Password ?',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: AppLightColor.primaryText,
                                      ),
                                    )),
                              ],
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
