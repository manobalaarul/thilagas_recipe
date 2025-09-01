import 'package:bloc/bloc.dart';
import 'package:thilagas_recipe/features/domain/usecases/razorpay/get_delivery_charge_usecase.dart';

import '../../../domain/entities/address/address_response_entity.dart';
import '../../../domain/entities/cart/cart_response_entity.dart';
import '../../utils/calculate_totalkg.dart';

part 'select_address_event.dart';
part 'select_address_state.dart';

class SelectAddressBloc extends Bloc<SelectAddresEvent, SelectAddressState> {
  final GetDeliveryChargeUsecase getDeliveryChargeUsecase;

  SelectAddressBloc(this.getDeliveryChargeUsecase)
      : super(SelectAddressState()) {
    on<SelectOneAddressEvent>(_selectAddress);
    on<RefreshDeliveryCharge>(_refreshDeliveryCharge);
  }

  _selectAddress(
      SelectOneAddressEvent event, Emitter<SelectAddressState> emit) async {
    emit(state.copyWith(status: SelectAddressStatus.loading));

    // 👇 calculate total kg from cart items
    final totalKg = calculateTotalKg(event.cartItems);

    // 👇 pass this to your delivery charge usecase
    final result = await getDeliveryChargeUsecase.call({
      "pincode": event.address.pincode,
      "weightKg": totalKg,
    });
    print("Result : $result");
    result.fold((failure) {
      emit(state.copyWith(
          status: SelectAddressStatus.error, errorMsg: failure.message));
    }, (loadedData) {
      emit(state.copyWith(
          status: SelectAddressStatus.loaded,
          deliveryCharge: loadedData['data']['charges'],
          address: event.address));
    });
  }

  _refreshDeliveryCharge(
      RefreshDeliveryCharge event, Emitter<SelectAddressState> emit) async {
    // 👇 calculate total kg from cart items
    final totalKg = calculateTotalKg(event.cartItems);

    // 👇 pass this to your delivery charge usecase
    final result = await getDeliveryChargeUsecase.call({
      "pincode": state.address!.pincode,
      "weightKg": totalKg,
    });
    result.fold((failure) {
      emit(state.copyWith(
          status: SelectAddressStatus.error, errorMsg: failure.message));
    }, (loadedData) {
      emit(state.copyWith(
          status: SelectAddressStatus.loaded,
          deliveryCharge: loadedData['data']['charges'],
          address: state.address));
    });
  }
}
