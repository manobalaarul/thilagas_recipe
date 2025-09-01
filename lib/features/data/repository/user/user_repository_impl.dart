import 'package:dartz/dartz.dart';
import 'package:thilagas_recipe/features/domain/entities/address/address_response_entity.dart';
import 'package:thilagas_recipe/features/domain/entities/order/order_response_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../domain/entities/common/common_response_entity.dart';
import '../../../domain/repository/user/user_repository.dart';
import '../../remote/datasource/user/user_remote_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource userRemoteDatasource;
  UserRepositoryImpl({required this.userRemoteDatasource});
  @override
  Future<Either<Failure, CommonResponseEntity>> fetchUserDetails(params) async {
    try {
      final fetchUser = await userRemoteDatasource.fetchUserDetails(params);
      return Right(fetchUser);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ServerFailure(message: 'Unexpected error'));
    }
  }

  @override
  Future<Either<Failure, CommonResponseEntity>> updateUserDetails(
      params) async {
    try {
      final updateUser = await userRemoteDatasource.updateUserDetaiils(params);
      return Right(updateUser);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ServerFailure(message: 'Unexpected error'));
    }
  }

  @override
  Future<Either<Failure, AddressResponseEntity>> getAddress(params) async {
    try {
      final getAddress = await userRemoteDatasource.getAddress(params);
      return Right(getAddress);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ServerFailure(message: 'Unexpected error'));
    }
  }

  @override
  Future<Either<Failure, OrderResponseEntity>> getOrders(params) async {
    try {
      final getOrders = await userRemoteDatasource.getOrders(params);
      return Right(getOrders);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ServerFailure(message: 'Unexpected error'));
    }
  }

  @override
  Future<Either<Failure, CommonResponseEntity>> addAddress(params) async {
    try {
      final addAddress = await userRemoteDatasource.addAddress(params);
      return Right(addAddress);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ServerFailure(message: 'Unexpected error'));
    }
  }

  @override
  Future<Either<Failure, CommonResponseEntity>> deleteAddress(params) {
    // TODO: implement deleteAddress
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CommonResponseEntity>> updateAddress(params) {
    // TODO: implement updateAddress
    throw UnimplementedError();
  }
}
