// razorpay_repository_impl.dart
import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../domain/entities/razorpay/razorpay_entity.dart';
import '../../../domain/repository/razorpay/payment_repository.dart';
import '../../remote/datasource/razorpay/razorpay_remote_datasource.dart';
import '../../remote/model/razorpay/payment_model.dart';
import '../../remote/model/razorpay/payment_order_model.dart';

class RazorpayRepositoryImpl implements RazorpayRepository {
  final RazorpayRemoteDatasource razorpayRemoteDatasource;

  RazorpayRepositoryImpl({required this.razorpayRemoteDatasource});

  @override
  Future<Either<Failure, RazorpayOrderEntity>> createRazorpayOrder(
      dynamic params) async {
    try {
      final response =
          await razorpayRemoteDatasource.createRazorpayOrder(params);
      final razorpayOrder = RazorpayOrder.fromJson(response);

      // Convert model to entity
      final entity = RazorpayOrderEntity(
        id: razorpayOrder.id,
        amount: razorpayOrder.amount,
        currency: razorpayOrder.currency,
        receipt: razorpayOrder.receipt,
        status: razorpayOrder.status,
      );

      return Right(entity);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ServerFailure(message: 'Unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> verifyAndPlaceOrder(
      dynamic params) async {
    try {
      final response =
          await razorpayRemoteDatasource.verifyAndPlaceOrder(params);
      final orderModel = PaymentOrderModel.fromJson(response);

      // Convert model to entity
      final entity = OrderEntity(
        orderId: orderModel.orderId,
        userId: orderModel.userId,
        products: orderModel.products
            .map((item) => OrderItemEntity(
                  productId: item.productId,
                  variantId: item.variantId,
                  productDetails: ProductDetailsEntity(
                    name: item.productDetails.name,
                    image: item.productDetails.image,
                  ),
                  variantDetails: VariantDetailsEntity(
                    name: item.variantDetails.name,
                  ),
                  price: item.price,
                  qty: item.qty,
                ))
            .toList(),
        paymentId: orderModel.paymentId,
        paymentStatus: orderModel.paymentStatus,
        deliveryAddress: orderModel.deliveryAddress,
        subTotalAmt: orderModel.subTotalAmt,
        totalAmt: orderModel.totalAmt,
        createdAt: orderModel.createdAt,
      );

      return Right(entity);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ServerFailure(message: 'Unexpected error occurred'));
    }
  }
}
