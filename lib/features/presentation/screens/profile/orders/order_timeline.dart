import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../domain/entities/order/order_response_entity.dart';

class OrderTimeline extends StatelessWidget {
  final Order item;

  const OrderTimeline({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: item.deliveryStatus.length,
          itemBuilder: (context, index) {
            var status = item.deliveryStatus[index];
            return TimelineTile(
              alignment: TimelineAlign.start,
              isFirst: index == 0,
              isLast: index == item.deliveryStatus.length - 1,
              indicatorStyle: IndicatorStyle(
                width: 20,
                color: Colors.green,
                iconStyle:
                    IconStyle(iconData: Icons.check, color: Colors.white),
              ),
              beforeLineStyle: const LineStyle(
                color: Colors.green,
                thickness: 3,
              ),
              endChild: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(status.title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(status.description,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
