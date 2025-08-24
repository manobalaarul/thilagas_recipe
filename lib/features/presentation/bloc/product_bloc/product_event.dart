part of 'product_bloc.dart';

class ProductEvent {
  const ProductEvent();
}

class GetProductEvent extends ProductEvent {}

class GetCategoryProductEvent extends ProductEvent {
  final String id;

  GetCategoryProductEvent({required this.id});
}
