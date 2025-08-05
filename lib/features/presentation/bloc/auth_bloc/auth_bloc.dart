import 'dart:developer';

import 'package:bloc/bloc.dart';
import '../../../domain/entities/request/login_request_entity.dart';
import '../../../domain/usecases/auth/login_usecase.dart';
import '../../../domain/usecases/auth/register_usecase.dart';

import '../../../domain/entities/auth/auth_response_entity.dart';
import '../../../domain/entities/request/register_request_entity.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUsecase registerUsecase;
  final LoginUsecase loginUsecase;

  AuthBloc(this.registerUsecase, this.loginUsecase) : super(AuthState()) {
    on<RegisterEvent>(_register);
    on<LoginEvent>(_login);
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

  _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final request = LoginRequestEntity(
      email: event.email,
      password: event.password,
    );
    final result = await loginUsecase.call(request);
    log(result.toString());
    result.fold((failure) {
      emit(state.copyWith(status: AuthStatus.error, errorMsg: failure.message));
    }, (loggedUser) {
      emit(state.copyWith(
          status: AuthStatus.loaded, successMsg: loggedUser.message));
    });
  }
}
