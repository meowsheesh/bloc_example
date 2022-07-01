part of 'login_bloc.dart';

// Это тоже абстрактный класс,
// который можно расширить другими классами

/*
* Один базовый класс нужен для того, чтобы
* на его основе создавать дочерние классы
* в тех файлах, где он используется.
* */

abstract class LoginState {
  const LoginState();
}

/*
* Поясним, почему Event является абстрактным классом 
* а State - конкретным типом. Дело в том, что
* мы уже создали экземпляр State
* для передачи его суперклассу в bloc,
* но событие мы еще не задействовали. 
* Как только это произойдет, мы создадим конкретный класс,
* чтобы инстанцировать и работать с ним. 
* */

class LoginInitial extends LoginState {}

class UpdateTextState extends LoginState {
  final String text;
  UpdateTextState({required this.text});
}

class ShowSnackbarState extends LoginState {}
