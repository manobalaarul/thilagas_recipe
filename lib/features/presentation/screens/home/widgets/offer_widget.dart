import 'package:flutter/cupertino.dart';
import '../../../../domain/entities/offers/offer_response_entity.dart';
import '../bloc/offer_bloc/offer_bloc.dart';

class OfferWidget extends StatelessWidget {
  final OfferState state;
  final OfferResponseEntity offers;
  const OfferWidget({super.key, required this.state, required this.offers});

  @override
  Widget build(BuildContext context) {
    return Text(offers.offer.title);
  }
}
