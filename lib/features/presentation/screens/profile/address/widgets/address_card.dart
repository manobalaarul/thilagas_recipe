import 'package:flutter/material.dart';

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

    return Visibility(
      visible: item.status,
      child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              // border: addressController.selectedAddress == item.id
              //     ? Border.all(color: AppLightColor.primary, width: 2)
              //     : Border.all(color: AppLightColor.primary, width: 1),
              color: isDarkTheme ? const Color(0xFF232323) : Colors.white,
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
    );
  }
}
