import 'package:dio/dio.dart';
import 'package:thilagas_recipe/features/data/remote/model/address/address_model.dart';
import 'package:thilagas_recipe/features/data/remote/model/common/common_response_model.dart';
import 'package:thilagas_recipe/features/data/remote/model/order/order_model.dart';

import '../../../../../core/constants/api_routes.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/network/dio_client.dart';

abstract class UserRemoteDatasource {
  Future<CommonResponseModel> updateUserDetaiils(dynamic params);
  Future<CommonResponseModel> fetchUserDetails(dynamic params);
  Future<AddressModel> getAddress(dynamic params);
  Future<OrderModel> getOrders(dynamic params);
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final DioClient dioClient;
  UserRemoteDatasourceImpl({required this.dioClient});

  @override
  Future<CommonResponseModel> updateUserDetaiils(params) async {
    try {
      final response =
          await dioClient.put(path: ApiRoutes.updateUserDetails, data: params);
      print(response.data);
      final offers = CommonResponseModel.fromJson(response.data);
      return offers;
    } on DioException catch (e) {
      throw ServerException(
        message:
            e.response?.data['message'] ?? 'Something went wrong in Flutter',
      );
    } catch (e) {
      throw ServerException(message: 'Something went wrong');
    }
  }

  @override
  Future<CommonResponseModel> fetchUserDetails(params) async {
    try {
      final response = await dioClient.get(path: ApiRoutes.fetchUserDetails);
      print(response.data);
      final offers = CommonResponseModel.fromJson(response.data);
      return offers;
    } on DioException catch (e) {
      throw ServerException(
        message:
            e.response?.data['message'] ?? 'Something went wrong in Flutter',
      );
    } catch (e) {
      throw ServerException(message: 'Something went wrong');
    }
  }

  @override
  Future<AddressModel> getAddress(params) async {
    try {
      final response = await dioClient.get(path: ApiRoutes.getAddress);
      print(response.data);
      final address = AddressModel.fromJson(response.data);
      return address;
    } on DioException catch (e, stack) {
      print("Address Error: $stack");

      throw ServerException(
        message: e.response?.data['message'] ?? 'Something went wrong',
      );
    } catch (e, stack) {
      print("Api Error : $stack");
      throw ServerException(message: 'Something went wrong');
    }
  }

  @override
  Future<OrderModel> getOrders(params) async {
    try {
      final response = await dioClient.get(path: ApiRoutes.getOrders);
      print(response.data);
      final orders = OrderModel.fromJson(response.data);
      return orders;
    } on DioException catch (e) {
      throw ServerException(
        message: e.response?.data['message'] ?? 'Something went wrong',
      );
    } catch (e, stack) {
      print("Api Error : $stack");
      throw ServerException(message: 'Something went wrong');
    }
  }
}
