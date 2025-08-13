import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'logincheck_event.dart';
part 'logincheck_state.dart';

class LogincheckBloc extends Bloc<LogincheckEvent, LogincheckState> {
  LogincheckBloc() : super(LogincheckState()) {
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
  }

  Future<void> _onCheckAuthStatus(
      CheckAuthStatus event, Emitter<LogincheckState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token != null && token.isNotEmpty) {
      emit(state.copyWith(status: LogincheckStatus.authenticated));
    } else {
      emit(state.copyWith(status: LogincheckStatus.unauthenticated));
    }
  }

  Future<void> _onLoggedIn(
      LoggedIn event, Emitter<LogincheckState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', event.token);
    emit(state.copyWith(status: LogincheckStatus.authenticated));
  }

  Future<void> _onLoggedOut(
      LoggedOut event, Emitter<LogincheckState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    emit(state.copyWith(status: LogincheckStatus.unauthenticated));
  }
}
