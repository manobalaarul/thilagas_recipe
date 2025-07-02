import 'package:dio/dio.dart';
import '../../model/category/category_model.dart';
import '../../../../../core/constants/api_routes.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/network/dio_client.dart';

abstract class CategoryRemoteDatasource {
  Future<CategoryModel> getCategory(dynamic params);
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
        message: e.response?.data['message'] ?? 'Something went wrong',
      );
    } catch (e) {
      throw ServerException(message: 'Something went wrong');
    }
  }
}
