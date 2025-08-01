import 'package:flutter/material.dart';

import '../../../../common_widgets/appbar/custom_appbar.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              // orderController.fetchOrders(),
            ]);
          },
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              CustomAppBar(
                title: 'My Orders',
                needBack: true,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  // Obx(() {
                  //   if (orderController.orderItems.isEmpty) {
                  //     return NoData(
                  //       data: 'No Orders',
                  //     );
                  //   }

                  //   return ListView.builder(
                  //     shrinkWrap: true, // Fixes vertical viewport issue
                  //     physics:
                  //         BouncingScrollPhysics(), // Enables smooth scrolling
                  //     itemCount: orderController.orderItems.length,
                  //     itemBuilder: (context, index) {
                  //       final item = orderController
                  //           .orderItems[index]; // Get item from the list
                  //       return OrderCard(item: item);
                  //     },
                  //   );
                  // }),
                ],
              ),
              SizedBox(
                height: media.height / 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
