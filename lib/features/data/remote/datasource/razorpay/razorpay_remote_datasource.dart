import 'package:dio/dio.dart';

import '../../../../../core/constants/api_routes.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/network/dio_client.dart';

abstract class RazorpayRemoteDatasource {
  Future<dynamic> createRazorpayOrder(dynamic params);
  Future<dynamic> verifyAndPlaceOrder(dynamic params);
  Future<dynamic> getDeliveryCharge(dynamic params);
}

class RazorpayRemoteDatasourceImpl implements RazorpayRemoteDatasource {
  final DioClient dioClient;
  RazorpayRemoteDatasourceImpl({required this.dioClient});

  @override
  Future<Map<String, dynamic>> createRazorpayOrder(params) async {
    try {
      final response =
          await dioClient.post(path: ApiRoutes.createOrder, data: params);
      print(response.data);
      final offers = response.data;
      return offers;
    } on DioException catch (e) {
      throw ServerException(
        message: e.response?.data['message'] ?? 'Something went wrong',
      );
    } catch (e) {
      throw ServerException(message: 'Something went wrong in Flutter');
    }
  }

  @override
  Future<Map<String, dynamic>> verifyAndPlaceOrder(params) async {
    try {
      final response =
          await dioClient.post(path: ApiRoutes.placeOrder, data: params);
      print(response.data);
      final offers = response.data;
      return offers;
    } on DioException catch (e) {
      throw ServerException(
        message: e.response?.data['message'] ?? 'Something went wrong',
      );
    } catch (e) {
      throw ServerException(message: 'Something went wrong in Flutter');
    }
  }

  @override
  Future<Map<String, dynamic>> getDeliveryCharge(params) async {
    try {
      final response =
          await dioClient.post(path: ApiRoutes.getDeliveryCharge, data: params);
      print(response.data);
      final offers = response.data;
      return offers;
    } on DioException catch (e) {
      throw ServerException(
        message: e.response?.data['message'] ?? 'Something went wrong',
      );
    } catch (e) {
      throw ServerException(message: 'Something went wrong in Flutter');
    }
  }
}
