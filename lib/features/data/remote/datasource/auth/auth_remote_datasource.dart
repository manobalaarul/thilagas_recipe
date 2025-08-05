import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../core/constants/api_routes.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/network/dio_client.dart';
import '../../model/auth/auth_response_model.dart';
import '../../model/auth/register_response_model.dart';

abstract class AuthRemoteDatasource {
  Future<RegisterResponseModel> register(dynamic params);
  Future<AuthResponseModel> login(dynamic params);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final DioClient dioClient;
  AuthRemoteDatasourceImpl({required this.dioClient});

  @override
  Future<RegisterResponseModel> register(params) async {
    try {
      final response = await dioClient.post(
          path: ApiRoutes.register, data: jsonEncode(params));
      print(" Response : ${response.data}");

      if (response.data is Map<String, dynamic>) {
        final responseData = response.data as Map<String, dynamic>;
        // Check for error field or success field
        if (responseData['error'] == true || responseData['success'] == false) {
          throw ServerException(
            message: responseData['message'] ?? 'Registration failed',
          );
        }
      }
      final user = RegisterResponseModel.fromJson(response.data);
      return user;
    } on ServerException {
      rethrow;
    } on DioException catch (e) {
      String errorMessage = 'Something went wrong';

      if (e.response?.data != null) {
        if (e.response!.data is Map<String, dynamic>) {
          errorMessage = e.response!.data['message'] ?? errorMessage;
        } else if (e.response!.data is String) {
          errorMessage = e.response!.data;
        }
      }

      throw ServerException(message: errorMessage);
    } catch (e) {
      throw ServerException(message: 'Something went wrong');
    }
  }

  @override
  Future<AuthResponseModel> login(params) async {
    try {
      final response = await dioClient.post(
        path: ApiRoutes.login,
        data: jsonEncode(params),
      );

      print("Raw response: ${response.data}");

      if (response.data is Map<String, dynamic>) {
        final responseData = response.data as Map<String, dynamic>;
        print("Parsed responseData: $responseData");

        if (responseData['error'] == true || responseData['success'] == false) {
          throw ServerException(
            message: responseData['message'] ?? 'Login failed',
          );
        }
      }

      final user = AuthResponseModel.fromJson(response.data);
      print("Parsed user: $user");
      return user;
    } on ServerException {
      rethrow;
    } on DioException catch (e) {
      String errorMessage = 'Something went wrong';

      if (e.response?.data != null) {
        if (e.response!.data is Map<String, dynamic>) {
          errorMessage = e.response!.data['message'] ?? errorMessage;
        } else if (e.response!.data is String) {
          errorMessage = e.response!.data;
        }
      }

      print("Dio error: $errorMessage");
      throw ServerException(message: errorMessage);
    } catch (e, stackTrace) {
      print("Unknown exception: $e");
      print("Stack trace: $stackTrace");
      throw ServerException(message: 'Something went wrong');
    }
  }
}
