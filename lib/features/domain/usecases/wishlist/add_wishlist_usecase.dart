import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../entities/wishlist/add/wishlist_add_response_entity.dart';
import '../../repository/wishlist/wishlist_repository.dart';

class AddWishlistUsecase
    implements UseCase<WishlistAddResponseEntity, dynamic> {
  final WishlistRepository repository;

  AddWishlistUsecase(this.repository);

  @override
  Future<Either<Failure, WishlistAddResponseEntity>> call(params) async {
    return await repository.addWishlistItems(params);
  }
}
