import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../domain/entities/address/address_response_entity.dart';
import '../../../domain/entities/common/common_response_entity.dart';
import '../../../domain/entities/order/order_response_entity.dart';
import '../../../domain/usecases/user/add_address_usecase.dart';
import '../../../domain/usecases/user/fetch_user_usecase.dart';
import '../../../domain/usecases/user/get_address_usecase.dart';
import '../../../domain/usecases/user/get_orders_usecase.dart';
import '../../../domain/usecases/user/update_user_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final FetchUserUsecase fetchUserUsecase;
  final UpdateUserUsecase updateUserUsecase;
  final GetAddressUsecase getAddressUsecase;
  final AddAddressUsecase addAddressUsecase;
  final GetOrderUsecase getOrderUsecase;

  UserBloc(this.fetchUserUsecase, this.updateUserUsecase,
      this.getAddressUsecase, this.getOrderUsecase, this.addAddressUsecase)
      : super(UserState()) {
    on<FetchUserEvent>(_fetchUser);
    on<UpdateUserEvent>(_updateUser);
    on<GetAddressEvent>(_getAddress);
    on<AddAddressEvent>(_addAddress);
    on<GetOrderEvent>(_getOrder);
  }

  _fetchUser(FetchUserEvent event, Emitter<UserState> emit) async {
    if (state.user == null) {
      emit(state.copyWith(fetchStatus: FetchUserStatus.loading));
    } else {
      emit(state.copyWith(fetchStatus: FetchUserStatus.loaded));
    }

    final result = await fetchUserUsecase.call({});

    result.fold((failure) {
      emit(state.copyWith(
          fetchStatus: FetchUserStatus.error, errorMsg: failure.message));
    }, (loadedUser) {
      emit(state.copyWith(
          fetchStatus: FetchUserStatus.loaded, user: loadedUser));
    });
  }

  _updateUser(UpdateUserEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(updateUserStatus: UpdateUserStatus.loading));

    final result = await updateUserUsecase
        .call({"name": event.name, "email": event.email, "phone": event.phone});

    result.fold((failure) {
      emit(state.copyWith(
          updateUserStatus: UpdateUserStatus.error, errorMsg: failure.message));
    }, (loadedUser) {
      emit(state.copyWith(
          updateUserStatus: UpdateUserStatus.loaded,
          user: loadedUser,
          successMsg: loadedUser.message));
      Fluttertoast.showToast(
        msg: loadedUser.message,
        toastLength: Toast.LENGTH_LONG,
      );
      add(FetchUserEvent());
    });
  }

  _getAddress(GetAddressEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(getAddressStatus: GetAddressStatus.loading));

    final result = await getAddressUsecase.call({});

    result.fold((failure) {
      emit(state.copyWith(
          getAddressStatus: GetAddressStatus.error, errorMsg: failure.message));
    }, (loadedAddress) {
      emit(state.copyWith(
          getAddressStatus: GetAddressStatus.loaded, address: loadedAddress));
    });
  }

  _getOrder(GetOrderEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(getOrderStatus: GetOrderStatus.loading));

    final result = await getOrderUsecase.call({});

    result.fold((failure) {
      emit(state.copyWith(
          getOrderStatus: GetOrderStatus.error, errorMsg: failure.message));
    }, (loadedOrders) {
      emit(state.copyWith(
          getOrderStatus: GetOrderStatus.loaded, order: loadedOrders));
    });
  }

  _addAddress(AddAddressEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(addAddressStatus: AddAddressStatus.loading));

    final result = await addAddressUsecase.call({
      "address_line": event.addressLine,
      "city": event.city,
      "state": event.state,
      "pincode": event.pincode,
      "country": event.country,
      "mobile": event.mobile,
    });

    result.fold((failure) {
      emit(state.copyWith(
          addAddressStatus: AddAddressStatus.error, errorMsg: failure.message));
    }, (loadedUser) {
      emit(state.copyWith(
          addAddressStatus: AddAddressStatus.loaded,
          successMsg: loadedUser.message));
      add(GetAddressEvent());
      Fluttertoast.showToast(
        msg: loadedUser.message,
        toastLength: Toast.LENGTH_LONG,
      );
    });
  }
}
