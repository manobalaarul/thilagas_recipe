import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../entities/wishlist/get/wishlist_response_entity.dart';
import '../../repository/wishlist/wishlist_repository.dart';

class GetWishlistUsecase implements UseCase<WishlistResponseEntity, dynamic> {
  final WishlistRepository repository;

  GetWishlistUsecase(this.repository);

  @override
  Future<Either<Failure, WishlistResponseEntity>> call(params) async {
    return await repository.getWishlistItems(params);
  }
}
