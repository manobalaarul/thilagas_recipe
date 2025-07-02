part of 'offer_bloc.dart';

enum OfferStatus { initial, loading, loaded, error }

class OfferState {
  final OfferStatus status;
  final OfferResponseEntity? offer;
  final String? errorMsg;
  final String? successMsg;

  OfferState(
      {this.status = OfferStatus.initial,
      this.offer,
      this.errorMsg,
      this.successMsg});

  OfferState copyWith(
      {OfferStatus? status,
      final OfferResponseEntity? offer,
      String? errorMsg,
      String? successMsg}) {
    return OfferState(
        status: status ?? this.status,
        offer: offer ?? this.offer,
        errorMsg: errorMsg ?? this.errorMsg,
        successMsg: successMsg ?? this.successMsg);
  }
}
