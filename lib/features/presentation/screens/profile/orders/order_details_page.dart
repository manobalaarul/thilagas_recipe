import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../common_widgets/appbar/custom_appbar.dart';
import 'order_details_card.dart';
import 'order_product_card.dart';
import 'order_timeline.dart';

class OrderDetailsPage extends StatefulWidget {
  final OrderModel item;
  const OrderDetailsPage({super.key, required this.item});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: CustomAppBar(
                  title: 'Order Details',
                  needBack: true,
                ),
              ),
              // Tab Bar
              TabBar(
                indicatorColor: AppLightColor.primary,
                labelColor: AppLightColor.primary,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "Order Details"),
                  Tab(text: "Products"),
                  Tab(text: "Delivery Update"),
                ],
              ),

              // TabBarView must be inside Expanded to avoid layout issues
              Expanded(
                child: TabBarView(
                  children: [
                    OrderDetailsCard(item: widget.item),
                    OrderProductCard(item: widget.item),
                    OrderTimeline(item: widget.item)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
