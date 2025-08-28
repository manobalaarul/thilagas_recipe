// razorpay_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/cart/cart_response_entity.dart';
import '../../../domain/entities/razorpay/razorpay_entity.dart';
import '../../../domain/usecases/razorpay/create_order_usecase.dart';
import '../../../domain/usecases/razorpay/verify_order_usecase.dart';

part 'razorpay_event.dart';
part 'razorpay_state.dart';

class RazorpayBloc extends Bloc<RazorpayEvent, RazorpayState> {
  final CreateOrderUsecase createOrderUsecase;
  final VerifyPaymentUsecase verifyPaymentUsecase;

  RazorpayBloc(
    this.createOrderUsecase,
    this.verifyPaymentUsecase,
  ) : super(const RazorpayState()) {
    on<CreateOrderEvent>(_onCreateOrder);
    on<VerifyPaymentEvent>(_onVerifyPayment);
    on<PaymentFailedEvent>(_onPaymentFailed);
    on<ResetPaymentEvent>(_onResetPayment);
  }

  Future<void> _onCreateOrder(
    CreateOrderEvent event,
    Emitter<RazorpayState> emit,
  ) async {
    emit(state.copyWith(status: PaymentStatus.creatingOrder));

    final result = await createOrderUsecase.call(
      CreateOrderParams(
        amount: event.amount,
        currency: event.currency,
        receipt: event.receipt,
      ),
    );

    result.fold(
      (failure) => emit(state.copyWith(
        status: PaymentStatus.error,
        errorMsg: failure.message,
      )),
      (razorpayOrder) => emit(state.copyWith(
        status: PaymentStatus.orderCreated,
        razorpayOrder: razorpayOrder,
      )),
    );
  }

  Future<void> _onVerifyPayment(
    VerifyPaymentEvent event,
    Emitter<RazorpayState> emit,
  ) async {
    emit(state.copyWith(status: PaymentStatus.verifyingPayment));

    final result = await verifyPaymentUsecase.call(
      VerifyPaymentParams(
        listItems: event.listItems,
        totalAmount: event.totalAmount,
        addressId: event.addressId,
        subTotalAmount: event.subTotalAmount,
        razorpayOrderId: event.razorpayOrderId,
        razorpayPaymentId: event.razorpayPaymentId,
        razorpaySignature: event.razorpaySignature,
      ),
    );

    result.fold(
      (failure) => emit(state.copyWith(
        status: PaymentStatus.error,
        errorMsg: failure.message,
      )),
      (order) => emit(state.copyWith(
        status: PaymentStatus.paymentSuccess,
        order: order,
        successMsg: 'Payment completed successfully!',
      )),
    );
  }

  void _onPaymentFailed(
    PaymentFailedEvent event,
    Emitter<RazorpayState> emit,
  ) {
    emit(state.copyWith(
      status: PaymentStatus.paymentFailed,
      errorMsg: event.errorMessage,
    ));
  }

  void _onResetPayment(
    ResetPaymentEvent event,
    Emitter<RazorpayState> emit,
  ) {
    emit(const RazorpayState());
  }
}
