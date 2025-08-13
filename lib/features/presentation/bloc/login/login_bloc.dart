import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:thilagas_recipe/core/constants/app_constants.dart';
import 'package:thilagas_recipe/features/utils/helper/value_preferences.dart';

import '../../../domain/entities/auth/auth_response_entity.dart';
import '../../../domain/entities/request/login_request_entity.dart';
import '../../../domain/usecases/auth/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;

  LoginBloc(this.loginUsecase) : super(LoginState()) {
    on<LoginActionEvent>(_login);
  }

  _login(LoginActionEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStatus.loading));
    final request = LoginRequestEntity(
      email: event.email,
      password: event.password,
    );
    final result = await loginUsecase.call(request);
    log(result.toString());
    result.fold((failure) {
      emit(
          state.copyWith(status: LoginStatus.error, errorMsg: failure.message));
    }, (loggedUser) {
      emit(state.copyWith(
          status: LoginStatus.loaded, successMsg: loggedUser.message));
      Prefs.setString(AppConstants.accessToken, loggedUser.user.accessToken);
      Prefs.setString(AppConstants.refreshToken, loggedUser.user.refreshToken);
      Prefs.setString(AppConstants.name, loggedUser.user.userDetails.name);
      Prefs.setString(AppConstants.email, loggedUser.user.userDetails.email);

      
    });
  }
}
