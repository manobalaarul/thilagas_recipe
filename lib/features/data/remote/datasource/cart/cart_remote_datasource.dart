import 'package:dio/dio.dart';
import 'package:thilagas_recipe/features/data/remote/model/common/common_response_model.dart';

import '../../../../../core/constants/api_routes.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/network/dio_client.dart';
import '../../model/cart/cart_model.dart';

abstract class CartRemoteDatasource {
  Future<CartModel> getCartItems(dynamic params);
  Future<CommonResponseModel> addCartItems(dynamic params);
  Future<CommonResponseModel> updateCartItems(dynamic params);
}

class CartRemoteDatasourceImpl implements CartRemoteDatasource {
  final DioClient dioClient;
  CartRemoteDatasourceImpl({required this.dioClient});

  @override
  Future<CartModel> getCartItems(params) async {
    try {
      final response = await dioClient.get(path: ApiRoutes.cartItems);
      print(response.data);
      final offers = CartModel.fromJson(response.data);
      return offers;
    } on DioException catch (e) {
      throw ServerException(
        message: e.response?.data['message'] ?? 'Something went wrong',
      );
    } catch (e) {
      throw ServerException(message: 'Something went wrong');
    }
  }

  @override
  Future<CommonResponseModel> addCartItems(params) async {
    try {
      final response =
          await dioClient.post(path: ApiRoutes.addCartItems, data: params);
      print(response.data);
      final offers = CommonResponseModel.fromJson(response.data);
      return offers;
    } on DioException catch (e) {
      throw ServerException(
        message: e.response?.data['message'] ?? 'Something went wrong',
      );
    } catch (e) {
      throw ServerException(message: 'Something went wrong');
    }
  }

  @override
  Future<CommonResponseModel> updateCartItems(params) async {
    try {
      final response =
          await dioClient.put(path: ApiRoutes.updateCartItems, data: params);
      print(response.data);
      final offers = CommonResponseModel.fromJson(response.data);
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
