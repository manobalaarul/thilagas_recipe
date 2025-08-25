import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../core/constants/api_routes.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/network/dio_client.dart';
import '../../model/category/category_model.dart';
import '../../model/category/sub_category_model.dart';

abstract class CategoryRemoteDatasource {
  Future<CategoryModel> getCategory(dynamic params);
  Future<SubCategoryModel> getSubCategory(dynamic params);
}

class CategoryRemoteDatasourceImpl implements CategoryRemoteDatasource {
  final DioClient dioClient;
  CategoryRemoteDatasourceImpl({required this.dioClient});

  @override
  Future<CategoryModel> getCategory(params) async {
    try {
      final response = await dioClient.get(path: ApiRoutes.getCategory);
      print(response.data);
      final offers = CategoryModel.fromJson(response.data);
      return offers;
    } on DioException catch (e) {
      throw ServerException(
        message:
            e.response?.data['message'] ?? 'Something went wrong in Flutter',
      );
    } catch (e) {
      throw ServerException(message: 'Something went wrong in Flutter');
    }
  }

  @override
  Future<SubCategoryModel> getSubCategory(params) async {
    try {
      final response = await dioClient.get(path: ApiRoutes.getSubCategory);

      print("Raw Response: ${response.data.runtimeType} => ${response.data}");

      // Check if response.data is a Map<String, dynamic>
      if (response.data is Map<String, dynamic>) {
        final subCategories = SubCategoryModel.fromJson(response.data);
        return subCategories;
      } else if (response.data is String) {
        // Sometimes APIs return String JSON, not Map
        final subCategories =
            SubCategoryModel.fromJson(jsonDecode(response.data));
        return subCategories;
      } else {
        throw ServerException(
            message: "Unexpected response format: ${response.data}");
      }
    } on DioException catch (e) {
      print("DioException: ${e.message}");
      throw ServerException(
        message: e.response?.data['message'] ?? 'Something went wrong with API',
      );
    } catch (e, stack) {
      print("Generic error: $e");
      print(stack);
      throw ServerException(message: 'Something went wrong in Flutter');
    }
  }
}
