import 'package:bloc/bloc.dart';

import '../../../domain/entities/address/address_response_entity.dart';

part 'select_address_event.dart';
part 'select_address_state.dart';

class SelectAddressBloc extends Bloc<SelectAddresEvent, SelectAddressState> {
  SelectAddressBloc() : super(SelectAddressState()) {
    on<SelectOneAddressEvent>(_register);
  }

  _register(
      SelectOneAddressEvent event, Emitter<SelectAddressState> emit) async {
    emit(state.copyWith(status: SelectAddressStatus.loading));
    emit(state.copyWith(
        status: SelectAddressStatus.loaded, address: event.address));
  }
}
