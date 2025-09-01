part of 'user_bloc.dart';

enum FetchUserStatus { initial, loading, loaded, error }

enum UpdateUserStatus { initial, loading, loaded, error }

enum GetAddressStatus { initial, loading, loaded, error }

enum AddAddressStatus { initial, loading, loaded, error }

enum GetOrderStatus { initial, loading, loaded, error }

class UserState {
  final FetchUserStatus fetchStatus;
  final UpdateUserStatus updateUserStatus;
  final GetAddressStatus getAddressStatus;
  final AddAddressStatus addAddressStatus;
  final GetOrderStatus getOrderStatus;
  final CommonResponseEntity? user;
  final AddressResponseEntity? address;
  final OrderResponseEntity? order;
  final String? errorMsg;
  final String? successMsg;

  UserState(
      {this.fetchStatus = FetchUserStatus.initial,
      this.updateUserStatus = UpdateUserStatus.initial,
      this.getAddressStatus = GetAddressStatus.initial,
      this.addAddressStatus = AddAddressStatus.initial,
      this.getOrderStatus = GetOrderStatus.initial,
      this.user,
      this.address,
      this.order,
      this.errorMsg,
      this.successMsg});

  UserState copyWith(
      {FetchUserStatus? fetchStatus,
      UpdateUserStatus? updateUserStatus,
      GetAddressStatus? getAddressStatus,
      AddAddressStatus? addAddressStatus,
      GetOrderStatus? getOrderStatus,
      final CommonResponseEntity? user,
      final AddressResponseEntity? address,
      final OrderResponseEntity? order,
      String? errorMsg,
      String? successMsg}) {
    return UserState(
        fetchStatus: fetchStatus ?? this.fetchStatus,
        updateUserStatus: updateUserStatus ?? this.updateUserStatus,
        getAddressStatus: getAddressStatus ?? this.getAddressStatus,
        addAddressStatus: addAddressStatus ?? this.addAddressStatus,
        getOrderStatus: getOrderStatus ?? this.getOrderStatus,
        user: user ?? this.user,
        address: address ?? this.address,
        order: order ?? this.order,
        errorMsg: errorMsg ?? this.errorMsg,
        successMsg: successMsg ?? this.successMsg);
  }
}
