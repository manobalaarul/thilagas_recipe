import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../entities/address/address_response_entity.dart';
import '../../repository/user/user_repository.dart';

class GetAddressUsecase implements UseCase<AddressResponseEntity, dynamic> {
  final UserRepository repository;

  GetAddressUsecase(this.repository);

  @override
  Future<Either<Failure, AddressResponseEntity>> call(params) async {
    return await repository.getAddress(params);
  }
}
