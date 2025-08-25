import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../entities/product/search_product_response_entity.dart';
import '../../repository/product/product_repository.dart';

class GetSearchProductUsecase
    implements UseCase<SearchProductResponseEntity, dynamic> {
  final ProductRepository repository;

  GetSearchProductUsecase(this.repository);

  @override
  Future<Either<Failure, SearchProductResponseEntity>> call(params) async {
    return await repository.getSearchProduct(params);
  }
}
