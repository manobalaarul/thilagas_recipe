import 'package:dio/dio.dart';

import '../../../../../core/constants/api_routes.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/network/dio_client.dart';
import '../../model/offers/offer_model.dart';

abstract class OffersRemoteDatasource {
  Future<OfferModel> getOffer(dynamic params);
}

class OffersRemoteDatasourceImpl implements OffersRemoteDatasource {
  final DioClient dioClient;
  OffersRemoteDatasourceImpl({required this.dioClient});

  @override
  Future<OfferModel> getOffer(params) async {
    try {
      final response = await dioClient.get(path: ApiRoutes.getOffer);
      print(response.data);
      final offers = OfferModel.fromJson(response.data);
      return offers;
    } on DioException catch (e) {
      throw ServerException(
        message: e.response?.data['message'] ?? 'Something went wrong',
      );
    } catch (e) {
      throw ServerException(message: 'Something went wrong');
    }
  }
}
