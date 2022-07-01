part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class LoginButtonTappedEvent extends LoginEvent {}

class ShowSnackBarButtonTappedEvent extends LoginEvent {}
