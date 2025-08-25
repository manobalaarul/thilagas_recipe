import 'package:dio/dio.dart';
import 'package:thilagas_recipe/features/data/remote/model/product/search_product_model.dart';

import '../../../../../core/constants/api_routes.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/network/dio_client.dart';
import '../../model/category/category_product_model.dart';
import '../../model/product/product_model.dart';

abstract class ProductRemoteDatasource {
  Future<ProductModel> getProduct(dynamic params);
  Future<CategoryProductModel> getCategoryProduct(dynamic params);
  Future<SearchProductModel> getSearchProduct(dynamic params);
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
      throw ServerException(message: 'Something went wrong in Flutter');
    }
  }

  @override
  Future<CategoryProductModel> getCategoryProduct(params) async {
    try {
      final response = await dioClient.post(
          path: ApiRoutes.getCategoryProduct, data: params);
      print(response.data);
      final offers = CategoryProductModel.fromJson(response.data);
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
  Future<SearchProductModel> getSearchProduct(params) async {
    try {
      final response =
          await dioClient.post(path: ApiRoutes.getSearchProduct, data: params);
      print(response.data);
      final searchProduct = SearchProductModel.fromJson(response.data);
      return searchProduct;
    } on DioException catch (e) {
      throw ServerException(
        message: e.response?.data['message'] ?? 'Something went wrong',
      );
    } catch (e, stack) {
      print("Generic Error : $stack");
      throw ServerException(message: 'Something went wrong in Flutter');
    }
  }
}
