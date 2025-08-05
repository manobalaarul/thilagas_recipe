import 'package:dartz/dartz.dart';
import '../../entities/request/login_request_entity.dart';
import '../../entities/auth/auth_response_entity.dart';
import '../../repository/auth/auth_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';

class LoginUsecase implements UseCase<AuthResponseEntity, LoginRequestEntity> {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  @override
  Future<Either<Failure, AuthResponseEntity>> call(LoginRequestEntity params) async {
    return await repository.login({
      'email': params.email,
      'password': params.password,
    });
  }
}
