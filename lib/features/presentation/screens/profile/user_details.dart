import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../common_widgets/appbar/custom_appbar.dart';
import '../../../common_widgets/buttons/long_btn.dart';
import '../../../common_widgets/textfield/apptextformfield.dart';
import '../../bloc/user_bloc/user_bloc.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  bool loading = false;

  final ImagePicker _picker = ImagePicker();

  // Pick & Crop Image
  Future<File?> pickAndCropImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return null;

    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 80,
      maxHeight: 500,
      maxWidth: 500,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: "Crop Image",
          toolbarColor: AppLightColor.primary,
          toolbarWidgetColor: Colors.white,
          lockAspectRatio: true,
        ),
        IOSUiSettings(title: "Crop Image")
      ],
    );

    return croppedFile != null ? File(croppedFile.path) : null;
  }

  // void updateUser() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   await userController.updateUser(nameController.text, emailController.text,
  //       phoneController.text, gstController.text);

  //   await Get.find<GlobalController>().fetchUserDetails(); // Ensure GST updates

  //   setState(() {
  //     loading = false;
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.fetchStatus == FetchUserStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.user != null) {
          // Pre-fill controllers (you can also do this in initState with a BlocListener)
          nameController.text = state.user!.data['name'] ?? "";
          emailController.text = state.user!.data['email'] ?? "";
          phoneController.text = state.user!.data['mobile'].toString();
        }

        return Stack(
          children: [
            Scaffold(
              body: GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: SafeArea(
                  child: ListView(
                    padding: const EdgeInsets.all(10),
                    children: [
                      const CustomAppBar(needBack: true, title: 'User Details'),
                      SizedBox(height: media.height / 70),
                      const Text("Name",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                      SizedBox(height: media.height / 90),
                      AppTextFormField(
                        hintText: 'Name',
                        controller: nameController,
                      ),
                      SizedBox(height: media.height / 70),
                      const Text("Email",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                      SizedBox(height: media.height / 90),
                      AppTextFormField(
                        hintText: 'Email',
                        controller: emailController,
                      ),
                      SizedBox(height: media.height / 70),
                      const Text("Phone",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                      SizedBox(height: media.height / 90),
                      AppTextFormField(
                        hintText: 'Phone',
                        controller: phoneController,
                      ),
                      SizedBox(height: media.height / 20),
                      LongBtn(
                        onPressed: () {
                          context.read<UserBloc>().add(
                                UpdateUserEvent(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                ),
                              );
                        },
                        title: 'Submit',
                        fontSize: 25,
                      )
                    ],
                  ),
                ),
              ),
            ),

            // Show loader if updating
            if (state.updateUserStatus == UpdateUserStatus.loading)
              const Opacity(
                opacity: 0.8,
                child: ModalBarrier(dismissible: false, color: Colors.black),
              ),
            if (state.updateUserStatus == UpdateUserStatus.loading)
              Center(
                child: LoadingAnimationWidget.fourRotatingDots(
                    color: Colors.white, size: 40),
              ),
          ],
        );
      },
    );
  }
}
