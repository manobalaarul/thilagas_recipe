import 'package:bloc/bloc.dart';
import '../../../../../domain/usecases/offers/get_offer_usecase.dart';

import '../../../../../domain/entities/offers/offer_response_entity.dart';

part 'offer_state.dart';
part 'offer_event.dart';

class OfferBloc extends Bloc<OfferEvent, OfferState> {
  final GetOfferUsecase getOfferUsecase;

  OfferBloc(this.getOfferUsecase) : super(OfferState()) {
    on<GetOfferEvent>(_getOffer);
  }

  _getOffer(GetOfferEvent event, Emitter<OfferState> emit) async {
    emit(state.copyWith(status: OfferStatus.loading));

    final result = await getOfferUsecase.call({});

    result.fold((failure) {
      emit(
          state.copyWith(status: OfferStatus.error, errorMsg: failure.message));
    }, (loadedOffer) {
      emit(state.copyWith(status: OfferStatus.loaded, offer: loadedOffer));
    });
  }
}
