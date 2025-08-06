import 'package:bloc/bloc.dart';
import '../../../domain/usecases/auth/register_usecase.dart';

import '../../../domain/entities/auth/auth_response_entity.dart';
import '../../../domain/entities/request/register_request_entity.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUsecase registerUsecase;

  AuthBloc(this.registerUsecase) : super(AuthState()) {
    on<RegisterEvent>(_register);
  }

  _register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final request = RegisterRequestEntity(
      name: event.name,
      email: event.email,
      password: event.password,
    );
    final result = await registerUsecase.call(request);
    result.fold((failure) {
      emit(state.copyWith(status: AuthStatus.error, errorMsg: failure.message));
    }, (loggedUser) {
      emit(state.copyWith(
          status: AuthStatus.loaded, successMsg: loggedUser.message));
    });
  }
}
