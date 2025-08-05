import 'package:dartz/dartz.dart';
import 'package:thilagas_recipe/features/domain/entities/auth/register/register_response_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../domain/entities/auth/auth_response_entity.dart';
import '../../../domain/repository/auth/auth_repository.dart';
import '../../remote/datasource/auth/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  AuthRepositoryImpl({required this.authRemoteDatasource});
  @override
  Future<Either<Failure, RegisterResponseEntity>> register(params) async {
    try {
      final user = await authRemoteDatasource.register(params);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ServerFailure(message: 'Unexpected error'));
    }
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> login(params) async {
    try {
      final user = await authRemoteDatasource.login(params);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ServerFailure(message: 'Unexpected error'));
    }
  }
}
