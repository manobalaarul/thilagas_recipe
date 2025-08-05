import 'package:flutter/material.dart';
import '../../../../domain/entities/order/order_response_entity.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../common_widgets/buttons/long_btn.dart';
import '../../../utils/display_in_rupees.dart';
import '../../../utils/text_date.dart';

class OrderDetailsCard extends StatelessWidget {
  final Order item;
  const OrderDetailsCard({super.key, required this.item});

  Future<void> openURL(String orderId) async {
    final Uri url = Uri.parse(
        'https://www.thilagasrecipe.in/dashboard/invoice?id=${orderId}');

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Placed On',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Divider(),
          SizedBox(
            height: media.height / 90,
          ),
          Text(
            formatTextDate(item.createdAt.toString()),
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: media.height / 30,
          ),
          Text(
            'Delivery Address',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Divider(),
          SizedBox(
            height: media.height / 90,
          ),
          Text(
            item.deliveryAddress.addressLine,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Text(
            "${item.deliveryAddress.city}, ${item.deliveryAddress.state}",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Text(
            item.deliveryAddress.pincode,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Text(
            item.deliveryAddress.mobile.toString(),
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: media.height / 30,
          ),
          Text(
            'Payment Summary',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Divider(),
          SizedBox(
            height: media.height / 90,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sub Total',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text(
                displayPriceInRupees(item.subTotalAmt.toInt()),
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppLightColor.primary),
              )
            ],
          ),
          SizedBox(
            height: media.height / 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery Charge',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                displayPriceInRupees(item.deliveryCharge.toInt()),
                style: TextStyle(fontSize: 17, color: AppLightColor.primary),
              )
            ],
          ),
          SizedBox(
            height: media.height / 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Gst',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                displayPriceInRupees(item.gst.toInt()),
                style: TextStyle(fontSize: 17, color: AppLightColor.primary),
              )
            ],
          ),
          SizedBox(
            height: media.height / 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                displayPriceInRupees(item.totalAmt.toInt()),
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppLightColor.primary),
              )
            ],
          ),
          SizedBox(
            height: media.height / 70,
          ),
          LongBtn(
            onPressed: () {
              openURL(item.orderId);
            },
            title: 'View Invoice',
            fontSize: 25,
            type: RoundButtonType.textPrimary,
          )
        ],
      ),
    );
  }
}
