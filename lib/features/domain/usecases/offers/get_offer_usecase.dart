import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../entities/offers/offer_response_entity.dart';
import '../../repository/offers/offer_repository.dart';

class GetOfferUsecase implements UseCase<OfferResponseEntity, dynamic> {
  final OfferRepository repository;

  GetOfferUsecase(this.repository);

  @override
  Future<Either<Failure, OfferResponseEntity>> call(params) async {
    return await repository.getOffer(params);
  }
}
