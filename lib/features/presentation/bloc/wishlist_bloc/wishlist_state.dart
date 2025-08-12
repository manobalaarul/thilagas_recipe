part of 'wishlist_bloc.dart';

enum WishlistStatus { initial, loading, loaded, error }

enum WishlistAddStatus { initial, loading, loaded, error }

enum WishlistRemoveStatus { initial, loading, loaded, error }

class WishlistState {
  final WishlistStatus status;
  final WishlistAddStatus addStatus;
  final WishlistRemoveStatus removeStatus;
  final WishlistResponseEntity? wishlist;
  final String? errorMsg;
  final String? successMsg;

  WishlistState(
      {this.status = WishlistStatus.initial,
      this.addStatus = WishlistAddStatus.initial,
      this.removeStatus = WishlistRemoveStatus.initial,
      this.wishlist,
      this.errorMsg,
      this.successMsg});

  WishlistState copyWith(
      {WishlistStatus? status,
      WishlistAddStatus? addStatus,
      WishlistRemoveStatus? removeStatus,
      final WishlistResponseEntity? wishlist,
      String? errorMsg,
      String? successMsg}) {
    return WishlistState(
        status: status ?? this.status,
        addStatus: addStatus ?? this.addStatus,
        removeStatus: removeStatus ?? this.removeStatus,
        wishlist: wishlist ?? this.wishlist,
        errorMsg: errorMsg ?? this.errorMsg,
        successMsg: successMsg ?? this.successMsg);
  }
}
