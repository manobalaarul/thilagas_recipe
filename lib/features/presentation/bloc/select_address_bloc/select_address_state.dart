part of 'select_address_bloc.dart';

enum SelectAddressStatus { loading, loaded, error }

class SelectAddressState {
  final SelectAddressStatus status;
  final Address? address;
  final String? errorMsg;
  final String? successMsg;

  SelectAddressState(
      {this.status = SelectAddressStatus.loading,
      this.address,
      this.errorMsg,
      this.successMsg});

  SelectAddressState copyWith(
      {SelectAddressStatus? status,
      final Address? address,
      String? errorMsg,
      String? successMsg}) {
    return SelectAddressState(
        status: status ?? this.status,
        address: address ?? address,
        errorMsg: errorMsg ?? this.errorMsg,
        successMsg: successMsg ?? this.successMsg);
  }
}
