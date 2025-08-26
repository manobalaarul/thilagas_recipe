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

class GetOrderEvent extends UserEvent {}
