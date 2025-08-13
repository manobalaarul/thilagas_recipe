import 'package:dio/dio.dart';
import 'package:thilagas_recipe/features/data/remote/model/common/common_response_model.dart';

import '../../../../../core/constants/api_routes.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/network/dio_client.dart';
import '../../model/wishlist/wishlist_add_model.dart';
import '../../model/wishlist/wishlist_model.dart';

abstract class WishlistRemoteDatasource {
  Future<WishlistModel> getWishlistItems(dynamic params);
  Future<WishlistAddModel> addWishlistItems(dynamic params);
  Future<CommonResponseModel> removeWishlistItems(dynamic params);
}

class WishlistRemoteDatasourceImpl implements WishlistRemoteDatasource {
  final DioClient dioClient;
  WishlistRemoteDatasourceImpl({required this.dioClient});

  @override
  Future<WishlistModel> getWishlistItems(params) async {
    try {
      final response = await dioClient.get(path: ApiRoutes.wishlistItems);
      print(response.data);
      final offers = WishlistModel.fromJson(response.data);
      return offers;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        print("error");
        throw ServerException(
          message: e.response?.data['message'] ?? 'Something went wrong',
        );
      }
      throw ServerException(
        message: e.response?.data['message'] ?? 'Something went wrong',
      );
    } catch (e) {
      throw ServerException(message: 'Something went wrong');
    }
  }

  @override
  Future<WishlistAddModel> addWishlistItems(params) async {
    try {
      final response =
          await dioClient.post(path: ApiRoutes.addWishlistItems, data: params);
      print(response.data);
      final offers = WishlistAddModel.fromJson(response.data);
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
  Future<CommonResponseModel> removeWishlistItems(params) async {
    try {
      final response = await dioClient.delete(
          path: ApiRoutes.removeWishlistItems, data: params);
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
