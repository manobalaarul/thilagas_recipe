import 'package:dartz/dartz.dart';
import 'package:thilagas_recipe/features/domain/entities/common/common_response_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../repository/cart/cart_repository.dart';

class UpdateCartUsecase implements UseCase<CommonResponseEntity, dynamic> {
  final CartRepository repository;

  UpdateCartUsecase(this.repository);

  @override
  Future<Either<Failure, CommonResponseEntity>> call(params) async {
    return await repository.updateCartItems(params);
  }
}
