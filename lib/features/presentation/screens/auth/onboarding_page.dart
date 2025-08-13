import 'package:flutter/material.dart';
import 'package:thilagas_recipe/core/constants/app_constants.dart';
import 'package:thilagas_recipe/features/presentation/screens/maintab/maintab.dart';
import 'package:thilagas_recipe/features/utils/helper/value_preferences.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../common_widgets/buttons/long_btn.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int selectedPage = 0;
  PageController controller = PageController();
  List pageArr = [
    {
      "title": "Get",
      "subtitle":
          "Add a burst of flavor to your breakfast with Thilaga’s Recipe Idli Powder - also known as Idli Milagai Podi or Gunpowder.",
      "image": "assets/images/on_boarding_1.png"
    },
    {
      "title": "Ready ?",
      "subtitle":
          "Boost your daily nutrition with Thilaga’s Recipe Curry Leaves Powder (Karuveppilai Podi) – a traditional South Indian side dish.",
      "image": "assets/images/on_boarding_2.png"
    },
    {
      "title": "Go",
      "subtitle":
          "Give your family the gift of traditional wellness with Thilaga’s Recipe Health Mix (Sathu Maavu) – a time-tested, multigrain nutrition blend made from 100% natural ingredients.",
      "image": "assets/images/on_boarding_3.png"
    },
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        selectedPage = controller.page?.floor() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/images/Bubbles4.png',
          height: media.height,
          width: media.width,
          fit: BoxFit.fill,
        ),
        PageView.builder(
            controller: controller,
            itemCount: pageArr.length,
            itemBuilder: (context, index) {
              var pObj = pageArr[index] as Map;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: media.width / 1.2,
                    height: media.height / 1.4,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: isDarkTheme
                            ? AppDarkColor.background
                            : AppLightColor.background,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image.asset(
                            pObj["image"].toString(),
                            width: media.width,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                pObj["title"].toString(),
                                style: TextStyle(
                                    color: isDarkTheme
                                        ? AppDarkColor.primaryText
                                        : AppLightColor.primaryText,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: media.width * 0.05,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 50, right: 50),
                                child: Text(
                                  pObj["subtitle"].toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: isDarkTheme
                                          ? AppDarkColor.primaryText
                                          : AppLightColor.primaryText,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
        Column(
          children: [
            SizedBox(
              height: media.height / 1.1,
            ),
            if (selectedPage != 2)
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pageArr.map((e) {
                    var index = pageArr.indexOf(e);
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: index == selectedPage
                              ? AppLightColor.primary
                              : AppLightColor.placeholder,
                          borderRadius: BorderRadius.circular(10)),
                    );
                  }).toList()),
            if (selectedPage == 2)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: LongBtn(
                    fontSize: 18,
                    onPressed: () {
                      if (selectedPage >= 2) {
                        Prefs.setBool(AppConstants.onBoardStatus, false);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainTab()));
                      } else {
                        setState(() {
                          selectedPage = selectedPage + 1;
                          controller.animateToPage(selectedPage,
                              duration: const Duration(microseconds: 500),
                              curve: Curves.bounceInOut);
                        });
                      }
                    },
                    title: "Next"),
              )
          ],
        ),
      ]),
    );
  }
}
