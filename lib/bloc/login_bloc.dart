import 'package:bloc/bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

/*
  Расширяем класс Bloc и также указываем тип для события и состояния. 
*/
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  /*
  * 1. Это метод конструктора 
  * Bloc, в случае создания API вы внедрите репозиторий. 

  * 2. Передаем первое событие в суперкласс, 
  * это первое сгенерированное событие,
  * мы можем применить его в UI для запуска кода настройки.
  */
  LoginBloc() : super(LoginInitial()) {
    /*
    * 1. С помощью этого метода мы регистрируем обработчик события с типом события.
    * В данном случае у нас Login Event,
    * так как Bloc работает в LoginEvent и LoginState

    * 2. Этот метод принимает два параметра Handler и transformer.
    * Transformer является необязательным методом, и здесь он отсутствует. 
    */

    // Примечание: у каждого события должен быть только один обработчик
    on<LoginEvent>(_loginEventHandler);

    on<LoginButtonTappedEvent>(_loginButtonTapped);
    on<ShowSnackBarButtonTappedEvent>(_showSnackBarTapped);
  }

  /*
  * 1. Данный метод возвращает Future void, что говорит о его
  * способности выполнять асинхронные операции.

  * 2. Он принимает два необходимых параметра 
  * Event и Emitter
  */

  Future<void> _loginEventHandler(LoginEvent e, Emitter emit) async {
    // Выполнение задачи по реализации бизнес-логики

    /*
    * У класса Emitter есть ряд других методов, 
    * но мы выбрали самый простой из них, 
    * так как нам нужно всего лишь сгенерировать состояние. 
    */
    emit(LoginInitial());
  }

  Future<void> _loginButtonTapped(
      LoginButtonTappedEvent e, Emitter emit) async {
    emit(UpdateTextState(text: "Text is sent from the Bloc"));
  }

  Future<void> _showSnackBarTapped(
      ShowSnackBarButtonTappedEvent e, Emitter emit) async {
    emit(ShowSnackbarState());
  }
}
