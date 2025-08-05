import 'package:dartz/dartz.dart';
import '../../entities/auth/auth_response_entity.dart';
import '../../../../core/errors/failures.dart';
import '../../entities/auth/register/register_response_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, RegisterResponseEntity>> register(dynamic params);
  Future<Either<Failure, AuthResponseEntity>> login(dynamic params);

}
