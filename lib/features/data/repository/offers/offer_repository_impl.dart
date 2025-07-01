import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../domain/entities/offers/offer_response_entity.dart';
import '../../../domain/repository/offers/offer_repository.dart';
import '../../remote/datasource/offers/offers_remote_datasource.dart';

class OfferRepositoryImpl implements OfferRepository {
  final OffersRemoteDatasource offersRemoteDatasource;

  OfferRepositoryImpl({required this.offersRemoteDatasource});
  @override
  Future<Either<Failure, OfferResponseEntity>> getOffer(params) async {
    try {
      final offers = await offersRemoteDatasource.getOffer(params);
      return Right(offers);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: 'Unexpected error'));
    }
  }
}
