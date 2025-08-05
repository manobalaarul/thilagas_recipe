part of 'auth_bloc.dart';

enum AuthStatus { initial, loading, loaded, error }

class AuthState {
  final AuthStatus status;
  final AuthResponseEntity? user;
  final String? errorMsg;
  final String? successMsg;

  AuthState(
      {this.status = AuthStatus.initial,
      this.user,
      this.errorMsg,
      this.successMsg});

  AuthState copyWith(
      {AuthStatus? status,
      final AuthResponseEntity? user,
      String? errorMsg,
      String? successMsg}) {
    return AuthState(
        status: status ?? this.status,
        user: user ?? user,
        errorMsg: errorMsg ?? this.errorMsg,
        successMsg: successMsg ?? this.successMsg);
  }
}
