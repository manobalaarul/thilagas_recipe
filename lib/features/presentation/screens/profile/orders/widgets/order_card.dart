import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../domain/entities/order/order_response_entity.dart';
import '../../../../utils/display_in_rupees.dart';
import '../order_details_page.dart';
import 'order_image_slider.dart';

class OrderCard extends StatelessWidget {
  final Order item;
  const OrderCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
        onTap: () {
          if (item.orderStatus == "Confirmed" ||
              item.orderStatus == "Delivered") {
            Get.to(() => OrderDetailsPage(
                  item: item,
                ));
          } else {
            Get.snackbar('Error', 'Order not yet confirmed..!');
          }
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: isDarkTheme ? const Color(0xFF232323) : Colors.white,
              borderRadius: BorderRadius.circular(7)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: OrderImageSlider(item: item)),
                  SizedBox(
                    width: media.width / 90,
                  ),
                  SizedBox(
                    width: media.width / 1.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.orderId,
                          style: const TextStyle(fontSize: 12),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Sub Total',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              width: media.width / 90,
                            ),
                            Text(
                              displayPriceInRupees(item.subTotalAmt.toInt()),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppLightColor.primary,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Delivery Charge',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              width: media.width / 90,
                            ),
                            Text(
                              item.orderStatus == "Pending"
                                  ? "-"
                                  : "${displayPriceInRupees(item.deliveryCharge.toInt())} + Gst",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppLightColor.primary,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              width: media.width / 90,
                            ),
                            Text(
                              item.orderStatus == "Pending"
                                  ? "-"
                                  : displayPriceInRupees(item.totalAmt.toInt()),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppLightColor.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: media.height / 90,
              ),
              Container(
                padding: const EdgeInsets.all(4),
                width: media.width,
                decoration: BoxDecoration(
                    color: item.orderStatus == "Pending"
                        ? isDarkTheme
                            ? const Color(0xFF474747)
                            : Colors.grey[500]
                        : AppLightColor.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    "Order ${item.orderStatus}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
