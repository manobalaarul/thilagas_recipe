import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../common_widgets/appbar/custom_appbar.dart';
import '../../../common_widgets/buttons/long_btn.dart';
import '../../../common_widgets/textfield/apptextformfield.dart';

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

  // void pickAndUploadAvatar() async {
  //   File? imageFile = await pickAndCropImage();
  //   if (imageFile != null) {
  //     Map<String, dynamic>? newAvatarUrl =
  //         await userController.updateAvatar(imageFile);
  //     if (newAvatarUrl != null) {
  //       userController.userModel.refresh();
  //       Get.snackbar("Success", "Profile picture updated successfully!");
  //     }
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    // nameController.text = userController.userModel.value!.name;
    // emailController.text = userController.userModel.value!.email;
    // phoneController.text = userController.userModel.value!.mobile.toString();
    // gstController.text = userController.userModel.value!.gstNo;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Stack(
      children: [
        Scaffold(
          body: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus
                  ?.unfocus(); // Unfocus text field
            },
            child: SafeArea(
                child: Stack(
              children: [
                Form(
                  child: ListView(
                    padding: EdgeInsets.all(10),
                    children: [
                      CustomAppBar(needBack: true, title: 'User Details'),
                      SizedBox(
                        height: media.height / 90,
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     // pickAndUploadAvatar();
                      //   },
                      //   child: Obx(() {
                      //     return CircleAvatar(
                      //       radius: media.width / 6,
                      //       child: ClipOval(
                      //         child: userController.isLoading.value
                      //             ? CircularProgressIndicator()
                      //             : Image.network(
                      //                 pathToUrl(userController
                      //                             .userModel.value!.avatar !=
                      //                         ""
                      //                     ? userController
                      //                         .userModel.value!.avatar
                      //                     : "/uploads/profile/users.png"),
                      //                 fit: BoxFit.cover,
                      //               ),
                      //       ),
                      //     );
                      //   }),
                      // ),
                      SizedBox(
                        height: media.height / 70,
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: media.height / 90,
                      ),
                      AppTextFormField(
                        hintText: 'Name',
                        controller: nameController,
                      ),
                      SizedBox(
                        height: media.height / 70,
                      ),
                      Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: media.height / 90,
                      ),
                      AppTextFormField(
                        hintText: 'Email',
                        controller: emailController,
                      ),
                      SizedBox(
                        height: media.height / 70,
                      ),
                      Text(
                        'Phone',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: media.height / 90,
                      ),
                      AppTextFormField(
                        hintText: 'Phone',
                        controller: phoneController,
                      ),
                      SizedBox(
                        height: media.height / 70,
                      ),
                      Text(
                        'GST (If Applicable)',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: media.height / 90,
                      ),
                      AppTextFormField(
                        hintText: 'Gst number',
                        controller: gstController,
                      ),
                      SizedBox(
                        height: media.height / 20,
                      ),
                      LongBtn(
                          onPressed: () {
                            // updateUser();
                          },
                          title: 'Submit',
                          fontSize: 25)
                    ],
                  ),
                ),
              ],
            )),
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
