part of 'logincheck_bloc.dart';

class LogincheckEvent {
  const LogincheckEvent();
}

class CheckAuthStatus extends LogincheckEvent {}

class LoggedIn extends LogincheckEvent {
  final String token;
  LoggedIn(this.token);
}

class LoggedOut extends LogincheckEvent {}
