import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class MostPopularCard extends StatelessWidget {
  const MostPopularCard({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Container(
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Container(
          width: media.width / 2.5,
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/images/flash.png',
                        width: media.width / 2.5,
                        fit: BoxFit.fill,
                      ))),
              SizedBox(
                height: media.height / 150,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '170',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.favorite,
                        size: 17,
                        color: AppDarkColor.primary,
                      ),
                    ],
                  ),
                  Text(
                    'New',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
