part of 'login_bloc.dart';

class LoginEvent {
  const LoginEvent();
}

class LoginActionEvent extends LoginEvent {
  final String email;
  final String password;

  LoginActionEvent({
    required this.email,
    required this.password,
  });
}
