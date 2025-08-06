part of 'login_bloc.dart';

enum LoginStatus { initial, loading, loaded, error }

class LoginState {
  final LoginStatus status;
  final AuthResponseEntity? user;
  final String? errorMsg;
  final String? successMsg;

  LoginState(
      {this.status = LoginStatus.initial,
      this.user,
      this.errorMsg,
      this.successMsg});

  LoginState copyWith(
      {LoginStatus? status,
      final AuthResponseEntity? user,
      String? errorMsg,
      String? successMsg}) {
    return LoginState(
        status: status ?? this.status,
        user: user ?? user,
        errorMsg: errorMsg ?? this.errorMsg,
        successMsg: successMsg ?? this.successMsg);
  }
}
