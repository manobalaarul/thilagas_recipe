import 'package:dio/dio.dart';

import '../../../../../core/constants/api_routes.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/network/dio_client.dart';
import '../../model/product/product_model.dart';

abstract class ProductRemoteDatasource {
  Future<ProductModel> getProduct(dynamic params);
}

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final DioClient dioClient;
  ProductRemoteDatasourceImpl({required this.dioClient});

  @override
  Future<ProductModel> getProduct(params) async {
    try {
      final response = await dioClient.post(path: ApiRoutes.getProduct, data: {
        "page": 1,
        "limit": 8,
      });
      print(response.data);
      final offers = ProductModel.fromJson(response.data);
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
