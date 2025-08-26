import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:thilagas_recipe/features/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:thilagas_recipe/features/presentation/screens/profile/address/widgets/address_card.dart';

import '../../../../common_widgets/appbar/custom_appbar.dart';
import '../../../../common_widgets/buttons/long_btn.dart';
import '../../../../common_widgets/design/no_data.dart';
import 'add_address.dart';

class MyAddress extends StatefulWidget {
  const MyAddress({super.key});

  @override
  State<MyAddress> createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            RefreshIndicator(
              onRefresh: () async {
                await Future.wait([
                  // addressController.fetchAddressItems(),
                ]);
              },
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: [
                  const CustomAppBar(
                    title: 'My Address',
                    needBack: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      BlocBuilder<UserBloc, UserState>(
                          builder: (context, state) {
                        switch (state.getAddressStatus) {
                          case GetAddressStatus.initial:
                          case GetAddressStatus.loading:
                            return const CircularProgressIndicator();
                          case GetAddressStatus.error:
                            return Center(child: Text(state.errorMsg!));
                          case GetAddressStatus.loaded:
                            final address = state.address?.address ?? [];

                            if (address.isEmpty) {
                              return const Center(
                                  child: NoData(
                                      data: "Your address list is empty"));
                            }

                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: address.length,
                              itemBuilder: (context, index) {
                                return AddressCard(item: address[index]);
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
            Positioned(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color:
                          isDarkTheme ? const Color(0xFF232323) : Colors.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  padding: const EdgeInsets.all(10),
                  width: media.width,
                  child: LongBtn(
                      onPressed: () {
                        Get.to(() => const AddAddress());
                      },
                      title: "Add Address",
                      fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }

//   void showAddressOptions(
//       BuildContext context, Address item, bool isDarkTheme) {
//     Get.bottomSheet(
//       Container(
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: isDarkTheme ? Color(0xFF232323) : Colors.white,
//           borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'Address Option',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             Divider(),
//             ListTile(
//               title: Text('Edit Address'),
//               onTap: () {
//                 Get.back(); // Close bottom sheet
//                 Get.to(() =>
//                     AddAddress(existingAddress: item)); // Navigate to Edit
//               },
//             ),
//             ListTile(
//               title: Text('Delete Address'),
//               onTap: () {
//                 Get.back(); // Close bottom sheet
//                 confirmDelete(context, item.id); // Ask for confirmation
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void confirmDelete(BuildContext context, String addressId) {
//     Get.defaultDialog(
//       title: "Delete Address",
//       middleText: "Are you sure you want to delete this address?",
//       textConfirm: "Yes",
//       textCancel: "No",
//       confirmTextColor: Colors.white,
//       barrierDismissible: false, // Prevents automatic closing
//       onConfirm: () async {
//         try {
//           await addressController.deleteAddress(addressId);
//           Get.snackbar(
//             "Success",
//             "Address deleted successfully",
//           );
//         } catch (e) {
//           Get.snackbar(
//             "Error",
//             "Failed to delete address",
//           );
//         }
//       },
//       onCancel: () {},
//     );
//   }
}
