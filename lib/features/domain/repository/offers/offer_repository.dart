import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../entities/offers/offer_response_entity.dart';

abstract class OfferRepository {
  Future<Either<Failure, OfferResponseEntity>> getOffer(dynamic params);
}
