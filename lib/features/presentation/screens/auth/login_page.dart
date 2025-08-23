import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:thilagas_recipe/features/presentation/bloc/login_check_bloc/logincheck_bloc.dart';
import 'package:thilagas_recipe/features/presentation/screens/maintab/maintab.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../common_widgets/buttons/long_btn.dart';
import '../../../common_widgets/textfield/apptextformfield.dart';
import '../../../utils/helper/value_preferences.dart';
import '../../bloc/cart_bloc/cart_bloc.dart';
import '../../bloc/login/login_bloc.dart';
import '../../bloc/wishlist_bloc/wishlist_bloc.dart';
import 'otp_verify_page.dart';
import 'signup_page.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formKey = GlobalKey<FormState>();
  bool passvisible = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void loginFunc() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => Center(
          child: LoadingAnimationWidget.fourRotatingDots(
            color: Colors.white,
            size: 40,
          ),
        ),
      );

      BlocProvider.of<LoginBloc>(context).add(
        LoginActionEvent(
          email: emailController.text.trim(),
          password: passwordController.text,
        ),
      );
    } else {
      debugPrint("Form is invalid");
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
      Fluttertoast.showToast(
        msg: "Enter email id to continue",
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  void addToAuthBloc(BuildContext context) async {
    final String? token = Prefs.getString(AppConstants.accessToken);
    context.read<LogincheckBloc>().add(LoggedIn(token!));
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
                  BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state.status == LoginStatus.loaded) {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context); // Close loading dialog
                        }
                        addToAuthBloc(context);
                        // Show success toast
                        Fluttertoast.showToast(
                          msg: state.successMsg ?? "Login Successful",
                          toastLength: Toast.LENGTH_LONG,
                        );

                        context.read<CartBloc>().add(GetCartEvent());
                        context.read<WishlistBloc>().add(GetWishlistEvent());

                        Get.offAll(() => const MainTab());
                      } else if (state.status == LoginStatus.error) {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context); // Close dialog
                        }
                        Fluttertoast.showToast(
                          msg: state.errorMsg ??
                              "An error occurred during login",
                          toastLength: Toast.LENGTH_LONG,
                        );
                      }
                    },
                    builder: (context, state) {
                      return Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUnfocus,
                        child: Container(
                          padding: const EdgeInsets.all(10),
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
                                  onPressed: loginFunc,
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
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Don\'t have an account ?'),
                                    TextButton(
                                        onPressed: () {
                                          Get.to(const SignupPage());
                                        },
                                        child: const Text('Register Now'))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
