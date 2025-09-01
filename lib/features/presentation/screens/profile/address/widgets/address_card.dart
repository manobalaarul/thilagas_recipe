import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thilagas_recipe/features/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:thilagas_recipe/features/presentation/bloc/select_address_bloc/select_address_bloc.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../domain/entities/address/address_response_entity.dart';

class AddressCard extends StatelessWidget {
  final Address item;
  const AddressCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<CartBloc, CartState>(builder: (context, cartState) {
      return BlocBuilder<SelectAddressBloc, SelectAddressState>(
          builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<SelectAddressBloc>().add(
                  SelectOneAddressEvent(
                      address: item, cartItems: cartState.cart!.cart),
                );
          },
          child: Visibility(
            visible: item.status,
            child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: isDarkTheme
                        ? state.address == item
                            ? Colors.grey[800]
                            : Color(0xFF232323)
                        : state.address == item
                            ? Colors.grey[400]
                            : Colors.white,
                    borderRadius: BorderRadius.circular(7)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      width: media.width,
                      decoration: BoxDecoration(
                          color: AppLightColor.primary,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        item.city,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: media.height / 70,
                    ),
                    Text(item.addressLine),
                    Text("${item.city}, ${item.state}, ${item.country}"),
                    Text(item.mobile.toString()),
                    Text(item.pincode)
                  ],
                )),
          ),
        );
      });
    });
  }
}
