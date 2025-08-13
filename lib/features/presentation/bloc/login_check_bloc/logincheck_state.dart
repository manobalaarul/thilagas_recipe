part of 'logincheck_bloc.dart';

enum LogincheckStatus { checking, authenticated, unauthenticated }

class LogincheckState {
  final LogincheckStatus status;
  final String? errorMsg;
  final String? successMsg;

  LogincheckState(
      {this.status = LogincheckStatus.checking,
      this.errorMsg,
      this.successMsg});

  LogincheckState copyWith(
      {LogincheckStatus? status, String? errorMsg, String? successMsg}) {
    return LogincheckState(
        status: status ?? this.status,
        errorMsg: errorMsg ?? this.errorMsg,
        successMsg: successMsg ?? this.successMsg);
  }
}
