part of 'select_address_bloc.dart';

class SelectAddresEvent {
  const SelectAddresEvent();
}

class SelectOneAddressEvent extends SelectAddresEvent {
  final Address address;
  final List<Cart> cartItems;
  SelectOneAddressEvent({
    required this.address,
    required this.cartItems,
  });
}

class RefreshDeliveryCharge extends SelectAddresEvent {
  final List<Cart> cartItems;

  RefreshDeliveryCharge({required this.cartItems});
}
