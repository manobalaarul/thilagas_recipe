import 'package:flutter/material.dart';

class RoundProduct extends StatelessWidget {
  const RoundProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(40)),
      child: CircleAvatar(
        radius: media.width / 12,
        foregroundImage: AssetImage('assets/images/top.png'),
      ),
    );
  }
}
