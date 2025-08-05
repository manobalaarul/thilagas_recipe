import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../entities/auth/register/register_response_entity.dart';
import '../../entities/request/register_request_entity.dart';
import '../../repository/auth/auth_repository.dart';

class RegisterUsecase
    implements UseCase<RegisterResponseEntity, RegisterRequestEntity> {
  final AuthRepository repository;

  RegisterUsecase(this.repository);

  @override
  Future<Either<Failure, RegisterResponseEntity>> call(
      RegisterRequestEntity params) async {
    return await repository.register({
      'name': params.name,
      'email': params.email,
      'password': params.password,
    });
  }
}
