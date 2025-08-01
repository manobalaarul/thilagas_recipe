import 'package:flutter/material.dart';


class SaleItemsCard extends StatelessWidget {
  const SaleItemsCard({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        // Get.to(FlashSale());
      },
      child: Container(
        width: media.width / 3.5,
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Container(
            padding: EdgeInsets.all(5),
            child: Stack(
              children: [
                Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          'assets/images/flash.png',
                          fit: BoxFit.fill,
                        ))),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        color: Colors.amber[900],
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      '20%',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
