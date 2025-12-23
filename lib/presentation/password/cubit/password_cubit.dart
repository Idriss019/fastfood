import 'package:equatable/equatable.dart';
import 'package:fastfood/DB/table/staffDB.dart';
import 'package:fastfood/data_class/staff_data.dart';
import 'package:fastfood/shared_pr/passwordSP.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  // String _password;
  final StaffSQL staffSQL;
  // final passwordSP = PasswordSP();

  // String get password => _password;
  // set newPassword(String value) => _password;

  PasswordCubit({required this.staffSQL}) : super(PasswordInitial()) {
    // loadPassword();
  }
  void updateState(PasswordState state) {
    emit(state);
  }

  Future<void> loadPasswordData() async {
    emit(state.copyWith(passwordData: await staffSQL.getAllStaff()));
  }

  void plusValueState(String value) {
    emit(state.copyWith(inputPassword: state.inputPassword + value));
  }

  // List<StaffData> loadPasswordData(){

  //   state.copyWith(passwordData: )
  // }

  bool changePasswordToStart() {
    String password = state.inputPassword;
    if (password != '') {
      for (var staff in state.passwordData) {
        if (staff.password == password) {
          emit(state.copyWith(
            errorPassword: '',
            inputPassword: '',
            login: staff.login,
            power: staff.position,
            ));
          return true;
        }else if (password.length >= 4) {
          emit(state.copyWith(errorPassword: 'Пароль не верный!'));
        }
      }
      // emit(state.copyWith(errorPassword: 'Пароль не верный!'));
      return false;
    } else {
      emit(state.copyWith(errorPassword: ''));
      return false;
    }
  }

  // bool changePasswordToStart(value) {
  //   print(value);
  //   if (value != '' && value == _password || value == '123') {
  //     emit(state.copyWith(errorPassword: ''));
  //     return true;
  //   } else if (value != '' && value != _password) {
  //     emit(state.copyWith(errorPassword: 'Пароль не верный!'));
  //     return false;
  //   } else {
  //     emit(state.copyWith(errorPassword: ''));
  //     return false;
  //   }
  // }

  // void inputPassword(value) {
  //   emit(state.copyWith(inputPassword: value));
  // }

  // void inputNewPassword(value) {
  //   emit(state.copyWith(newPassword: value));
  // }

  // void inputReplyPassword(value) {
  //   emit(state.copyWith(replyPassword: value));
  // }

  // void changeNewPassword() {
  //   if (state.inputPassword == '') {
  //     emit(state.copyWith(errorPassword: 'Введите пароль!'));
  //   } else if (state.inputPassword != _password &&
  //       state.inputPassword != '123456') {
  //     emit(state.copyWith(errorPassword: 'Пароль не верный!'));
  //   } else if (state.newPassword == '') {
  //     emit(state.copyWith(errorPassword: 'Введите новый пароль!'));
  //   } else if (state.newPassword != '' &&
  //       state.newPassword != state.replyPassword) {
  //     emit(state.copyWith(errorPassword: 'Новые пароли не совпадают!'));
  //   } else if (state.newPassword == state.replyPassword) {
  //     savePassword(state.newPassword);
  //     emit(
  //       state.copyWith(
  //         inputPassword: '',
  //         errorPassword: 'Пароль успешно обновлен!',
  //         newPassword: '',
  //         replyPassword: '',
  //       ),
  //     );
  //   } else {
  //     emit(state.copyWith(errorPassword: 'Не предвиденная ошибка!'));
  //     // return false;
  //   }
  // }

  // Future<void> loadPassword() async {
  //   final loadPassword = passwordSP.loadValue();
  //   _password = await loadPassword;
  // }

  // Future<void> savePassword(newPassword) async {
  //   _password = newPassword;
  //   await passwordSP.saveValue(newPassword);
  // }
}
