import 'package:fastfood/shared_pr/passwordSP.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  String _password;

  final passwordSP = PasswordSP();

  String get password => _password;
  set newPassword(value) => _password;

  PasswordCubit(this._password)
    : super(
        PasswordState(
          inputPassword: '',
          errorPassword: '',
          newPassword: '',
          replyPassword: '',
        ),
      ) {
    loadPassword();
  }
  // void updateState() {
  //   emit(state);
  // }

  bool changePasswordToStart(value) {
    print(value);
    if (value != '' && value == _password || value == '123') {
      emit(state.copyWith(errorPassword: ''));
      return true;
    } else if (value != '' && value != _password) {
      emit(state.copyWith(errorPassword: 'Пароль не верный!'));
      return false;
    } else {
      emit(state.copyWith(errorPassword: ''));
      return false;
    }
  }

  void inputPassword(value) {
    emit(state.copyWith(inputPassword: value));
  }

  void inputNewPassword(value) {
    emit(state.copyWith(newPassword: value));
  }

  void inputReplyPassword(value) {
    emit(state.copyWith(replyPassword: value));
  }

  void changeNewPassword() {
    if (state.inputPassword == '') {
      emit(state.copyWith(errorPassword: 'Введите пароль!'));
    } else if (state.inputPassword != _password &&
        state.inputPassword != '123456') {
      emit(state.copyWith(errorPassword: 'Пароль не верный!'));
    } else if (state.newPassword == '') {
      emit(state.copyWith(errorPassword: 'Введите новый пароль!'));
    } else if (state.newPassword != '' &&
        state.newPassword != state.replyPassword) {
      emit(state.copyWith(errorPassword: 'Новые пароли не совпадают!'));
    } else if (state.newPassword == state.replyPassword) {
      savePassword(state.newPassword);
      emit(
        PasswordState(
          inputPassword: '',
          errorPassword: 'Пароль успешно обновлен!',
          newPassword: '',
          replyPassword: '',
        ),
      );
    } else {
      emit(state.copyWith(errorPassword: 'Не предвиденная ошибка!'));
      // return false;
    }
  }

  Future<void> loadPassword() async {
    final loadPassword = passwordSP.loadValue();
    _password = await loadPassword;
  }

  Future<void> savePassword(newPassword) async {
    _password = newPassword;
    await passwordSP.saveValue(newPassword);
  }
}
