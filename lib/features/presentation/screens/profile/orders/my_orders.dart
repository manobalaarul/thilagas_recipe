import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thilagas_recipe/features/presentation/screens/profile/orders/widgets/order_card.dart';

import '../../../../common_widgets/appbar/custom_appbar.dart';
import '../../../../common_widgets/design/no_data.dart';
import '../../../bloc/user_bloc/user_bloc.dart';

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
            padding: const EdgeInsets.all(10),
            children: [
              const CustomAppBar(
                title: 'My Orders',
                needBack: true,
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                    switch (state.getOrderStatus) {
                      case GetOrderStatus.initial:
                      case GetOrderStatus.loading:
                        return const CircularProgressIndicator();
                      case GetOrderStatus.error:
                        return Center(child: Text(state.errorMsg!));
                      case GetOrderStatus.loaded:
                        final orders = state.order?.order ?? [];

                        if (orders.isEmpty) {
                          return const Center(
                              child: NoData(data: "Your orders is empty"));
                        }

                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: orders.length,
                          itemBuilder: (context, index) {
                            return OrderCard(item: orders[index]);
                          },
                        );
                    }
                  })
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
