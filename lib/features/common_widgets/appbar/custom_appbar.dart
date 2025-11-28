import 'package:flutter/material.dart';
import 'package:thilagas_recipe/features/common_widgets/appbar/light_dark_wid.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool needBack;

  const CustomAppBar({
    super.key,
    required this.title,
    this.needBack = false,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              needBack
                  ? Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(
                        child: const Icon(
                          Icons.arrow_back,
                          size: 25,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  : Container(),
              Container(
                width: media.width / 1.6,
                margin: const EdgeInsets.only(top: 4),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          Row(
            children: [
              InkWell(onTap: () {}, child: const Icon(Icons.notifications)),
              SizedBox(
                width: media.width / 20,
              ),
              LightDarkWid()
            ],
          ),
        ],
      ),
    );

    // AppBar(
    //   title: Text(
    //     title,
    //   ),
    //   actions: [
    //     IconButton(
    //         onPressed: () {
    //           authController.logoutController();
    //           Get.offAll(() => WelcomePage());
    //         },
    //         icon: Icon(Icons.person)),
    //     Obx(() => Switch(
    //           value: themeController.isDarkMode.value,
    //           onChanged: (value) {
    //             themeController.toggleTheme();
    //           },
    //         )),
    //   ],
    // );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
