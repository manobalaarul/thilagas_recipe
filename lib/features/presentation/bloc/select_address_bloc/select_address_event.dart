part of 'select_address_bloc.dart';

class SelectAddresEvent {
  const SelectAddresEvent();
}

class SelectOneAddressEvent extends SelectAddresEvent {
  final Address address;
  SelectOneAddressEvent({
    required this.address,
  });
}
