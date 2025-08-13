import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../entities/common/common_response_entity.dart';
import '../../repository/wishlist/wishlist_repository.dart';

class RemoveWishlistUsecase implements UseCase<CommonResponseEntity, dynamic> {
  final WishlistRepository repository;

  RemoveWishlistUsecase(this.repository);

  @override
  Future<Either<Failure, CommonResponseEntity>> call(params) async {
    return await repository.removeWishlistItems(params);
  }
}
