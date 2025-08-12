import 'package:dio/dio.dart';
import '../../model/cart/cart_model.dart';
import '../../../../../core/constants/api_routes.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/network/dio_client.dart';

abstract class CartRemoteDatasource {
  Future<CartModel> getCartItems(dynamic params);
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
}
