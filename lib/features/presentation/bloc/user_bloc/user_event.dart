part of 'user_bloc.dart';

class UserEvent {
  const UserEvent();
}

class FetchUserEvent extends UserEvent {}

class UpdateUserEvent extends UserEvent {
  final String name;
  final String email;
  final String phone;

  UpdateUserEvent(
      {required this.name, required this.email, required this.phone});
}

class GetAddressEvent extends UserEvent {}

class AddAddressEvent extends UserEvent {
  final String addressLine;
  final String city;
  final String state;
  final String pincode;
  final String country;
  final String mobile;

  AddAddressEvent(
      {required this.addressLine,
      required this.city,
      required this.state,
      required this.pincode,
      required this.country,
      required this.mobile});
}

class DeleteAddressEvent extends UserEvent {
  final String id;

  DeleteAddressEvent({required this.id});
}

class GetOrderEvent extends UserEvent {}
