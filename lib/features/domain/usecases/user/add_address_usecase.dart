import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../entities/common/common_response_entity.dart';
import '../../repository/user/user_repository.dart';

class AddAddressUsecase implements UseCase<CommonResponseEntity, dynamic> {
  final UserRepository repository;

  AddAddressUsecase(this.repository);

  @override
  Future<Either<Failure, CommonResponseEntity>> call(params) async {
    return await repository.addAddress(jsonEncode(params));
  }
}
