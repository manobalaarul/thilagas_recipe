import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:thilagas_recipe/features/presentation/bloc/user_bloc/user_bloc.dart';

import '../../../../common_widgets/appbar/custom_appbar.dart';
import '../../../../common_widgets/buttons/long_btn.dart';
import '../../../../common_widgets/textfield/apptextformfield.dart';
import '../../../../domain/entities/address/address_response_entity.dart';

class AddAddress extends StatefulWidget {
  final Address? existingAddress; // ✅ Nullable parameter for edit mode

  const AddAddress({super.key, this.existingAddress});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  late TextEditingController addressLineController;
  late TextEditingController cityController;
  late TextEditingController stateController;
  late TextEditingController pincodeController;
  late TextEditingController countryController;
  late TextEditingController mobileController;

  bool loading = false;
  bool isEditing = false; // ✅ To check edit mode

  @override
  void initState() {
    super.initState();

    isEditing = widget.existingAddress != null;

    // Initialize controllers and pre-fill if editing
    addressLineController =
        TextEditingController(text: widget.existingAddress?.addressLine ?? '');
    cityController =
        TextEditingController(text: widget.existingAddress?.city ?? '');
    stateController =
        TextEditingController(text: widget.existingAddress?.state ?? '');
    pincodeController =
        TextEditingController(text: widget.existingAddress?.pincode ?? '');
    countryController =
        TextEditingController(text: widget.existingAddress?.country ?? '');
    mobileController =
        TextEditingController(text: widget.existingAddress?.mobile ?? '');
  }

  void saveAddress() async {
    setState(() => loading = true);

    try {
      Map<String, dynamic> address = {
        "id": widget.existingAddress?.id ?? "", // ✅ Keep existing ID if editing
        "address_line": addressLineController.text,
        "city": cityController.text,
        "state": stateController.text,
        "pincode": pincodeController.text,
        "country": countryController.text,
        "mobile": mobileController.text,
        "status": true,
      };

      if (isEditing) {
        context.read<UserBloc>().add(AddAddressEvent(
              addressLine: addressLineController.text,
              city: cityController.text,
              state: stateController.text,
              pincode: pincodeController.text,
              country: countryController.text,
              mobile: mobileController.text,
            ));
      } else {
        context.read<UserBloc>().add(AddAddressEvent(
              addressLine: addressLineController.text,
              city: cityController.text,
              state: stateController.text,
              pincode: pincodeController.text,
              country: countryController.text,
              mobile: mobileController.text,
            ));
      }
      Navigator.pop(context);
    } catch (e) {
      print("Error: $e");
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Stack(
      children: [
        Scaffold(
          body: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus
                  ?.unfocus(); // Unfocus text field
            },
            child: SafeArea(
              child: Stack(
                children: [
                  Form(
                    child: ListView(
                      padding: EdgeInsets.all(10),
                      children: [
                        CustomAppBar(
                            needBack: true,
                            title: isEditing ? 'Edit Address' : 'Add Address'),
                        SizedBox(height: media.height / 90),
                        buildTextField("Address Line", addressLineController),
                        buildTextField("City", cityController),
                        buildTextField("State", stateController),
                        buildTextField("Pincode", pincodeController),
                        buildTextField("Country", countryController),
                        buildTextField("Mobile", mobileController),
                        SizedBox(height: media.height / 20),
                        LongBtn(
                          onPressed: () {
                            saveAddress();
                          },
                          title: isEditing
                              ? 'Update'
                              : 'Submit', // ✅ Dynamic button text
                          fontSize: 25,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (loading)
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (loading)
          Center(
            child: LoadingAnimationWidget.fourRotatingDots(
                color: Colors.white, size: 40),
          ),
      ],
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        AppTextFormField(hintText: label, controller: controller),
        SizedBox(height: 16),
      ],
    );
  }
}
