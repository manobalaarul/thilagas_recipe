import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../common_widgets/buttons/long_btn.dart';
import '../../../common_widgets/textfield/apptextformfield.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';

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

  void signupFunc() {
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

      BlocProvider.of<AuthBloc>(context).add(
        RegisterEvent(
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text,
        ),
      );
    } else {
      debugPrint("Form is invalid");
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
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state.status == AuthStatus.loaded) {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context); // Close loading dialog
                        }

                        // Show success toast
                        Fluttertoast.showToast(
                          msg: state.successMsg ?? "Signup Successful",
                          toastLength: Toast.LENGTH_LONG,
                        );

                        // Navigate back to previous screen after a short delay
                        Future.delayed(const Duration(milliseconds: 500), () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(
                                context); // Navigate back to previous screen
                          }
                        });
                      } else if (state.status == AuthStatus.error) {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context); // Close dialog
                        }
                        Fluttertoast.showToast(
                          msg: state.errorMsg ??
                              "An error occurred during signup",
                          toastLength: Toast.LENGTH_LONG,
                        );
                      }
                    },
                    builder: (context, state) {
                      return Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: media.height / 5),
                              // Heading
                              Text(
                                'Create\nAccount',
                                style: TextStyle(
                                  color: isDarkTheme
                                      ? AppDarkColor.primaryText
                                      : AppLightColor.primaryText,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: media.height / 20),
                              // Fields...
                              AppTextFormField(
                                hintText: "Name",
                                controller: nameController,
                                validator: (value) => value!.isEmpty
                                    ? 'Please enter your name'
                                    : null,
                              ),
                              SizedBox(height: media.height / 50),
                              AppTextFormField(
                                hintText: "Email",
                                controller: emailController,
                                validator: (value) => value!.isEmpty
                                    ? 'Please enter your email'
                                    : null,
                              ),
                              SizedBox(height: media.height / 50),
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
                                  icon: Icon(passvisible
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      passvisible = !passvisible;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: media.height / 50),
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
                                  icon: Icon(conPassvisible
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      conPassvisible = !conPassvisible;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: media.height / 50),
                              LongBtn(
                                onPressed: signupFunc,
                                title: "Next",
                                fontSize: 20,
                              ),
                              Center(
                                child: TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Cancel',
                                      style: TextStyle(fontSize: 18)),
                                ),
                              ),
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
        // if (loading)
        //   const Opacity(
        //     opacity: 0.8,
        //     child: ModalBarrier(dismissible: false, color: Colors.black),
        //   ),
        // if (loading)
        //   Center(
        //     child: LoadingAnimationWidget.fourRotatingDots(
        //         color: Colors.white, size: 40),
        //   ),
      ],
    );
  }
}
