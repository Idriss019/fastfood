import 'dart:async';

import 'package:fastfood/DB/table/staffDB.dart';
import 'package:fastfood/data_class/staff_data.dart';
// import 'package:fastfood/global_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:string_capitalize/string_capitalize.dart';

part 'staff_event.dart';
part 'staff_state.dart';

class StaffBloc extends Bloc<StaffEvent, StaffState> {
  final StaffSQL staffSQL;
  StaffBloc(this.staffSQL) : super(StaffInitial()) {
    /* События */
    on<InsertStaffEvent>((event, emit) async {
      await staffSQL.insertStaff(event.staffData);
    });

    // Получить всех сотрудников listener
    on<StaffEvent>((event, emit) async {
      final staffList = await staffSQL.getAllStaff();
      // print('/////////');
      // print(staffList);
      emit(state.copyWith(staffDataList: staffList));
    });

    // Обновить стейт
    on<UpdateState>((event, emit) async {
      emit(event.state);
    });

    // получать всех сотрудников при изменении в БД
    on<ListenerDataDB>((event, emit) async {
      // final staffList = await staffSQL.getAllStaff();
      // for (var staff in staffList) {
      //   // print('Сотрудник из БД: Логин: ${staff.login}, \nПолномочия: ${staff.powers}');

      // }
      // print('****');
      // print(event.staffDataList);
      emit(state.copyWith(staffDataList: event.staffDataList));
    });

    // Изменение пароля сотрудника
    on<UpdatePasswordEvent>((event, emit) async {
      String message = changeInputNewPassword(
        event.oldPassword,
        event.retryOldPassword,
        event.newPassword,
      );
      if (message == '0') {
        message = changeInputOldPassword(event.staffData, event.oldPassword);
        if (message == '0') {
          message = await identityCheckPassword(event.newPassword);
          if (message == '0') {
            updateStaffData(
              event.staffData.copyWith(password: event.newPassword),
            );
            event.func();
          } else {
            ScaffoldMessenger.of(event.context).showSnackBar(
              SnackBar(
                content: Text(
                  message,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                duration: Duration(seconds: 2),
              ),
            );
            // showDialogOk(event.context, message, () {});
          }
        } else {
          ScaffoldMessenger.of(event.context).showSnackBar(
            SnackBar(
              content: Text(
                message,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              duration: Duration(seconds: 2),
            ),
          );
          // showDialogOk(event.context, message, () {});
        }
      } else {
        ScaffoldMessenger.of(event.context).showSnackBar(
          SnackBar(
            content: Text(
              message,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            duration: Duration(seconds: 2),
          ),
        );
        // showDialogOk(event.context, message, () {});
      }
    });
  }

  /* Функции */
  StreamSubscription? _staffSubscription;
  // Проверка ввода логина и пароля
  String changeInput(String login, String password) {
    if (login.isEmpty) {
      return 'Введите логин!';
    }
    if (password.isEmpty) {
      return 'Введите пароль!';
    }
    if (password.length < 4) {
      return 'Введите пароль не менее 4 символов!';
    } else {
      return '0';
    }
  }

  // Проверка на уникальность логина и пароля
  Future<String> identityCheck(String login, String password) async {
    String result = '0';

    await staffSQL.getAllStaff().then((staffList) {
      for (var staff in staffList) {
        if (staff.login == login.toLowerCase().capitalize()) {
          return result = 'Этот логин занят!';
        }
        if (staff.password == password) {
          return result = 'Этот пароль занят!';
        }
      }
    });
    return result;
  }

  // Проверка ввода нового пароля
  String changeInputNewPassword(
    String oldPassword,
    String retryOldPassword,
    String newPassword,
  ) {
    if (oldPassword.isEmpty) {
      return 'Введите старый пароль!';
    }
    if (retryOldPassword.isEmpty) {
      return 'Повторите старый пароль!';
    }
    if (newPassword.isEmpty) {
      return 'Введите новый пароль!';
    }
    if (newPassword.length < 4) {
      return 'Введите новый пароль не менее 4 символов!';
    }
    if (retryOldPassword != newPassword) {
      return 'Новый пароль не совпадает!';
    } else {
      return '0';
    }
  }

  // Проверка ввода старого пароля
  String changeInputOldPassword(StaffData staffData, String oldPassword) {
    if (oldPassword != staffData.password) {
      return 'Старый пароль введён неверно!';
    } else {
      return '0';
    }
  }

  // Проверка на уникальность пароля
  Future<String> identityCheckPassword(String password) async {
    String result = '0';

    await staffSQL.getAllStaff().then((staffList) {
      for (var staff in staffList) {
        if (staff.password == password) {
          return result = 'Этот пароль занят!';
        }
      }
    });
    return result;
  }

  // Обновить список сотрудников в DB
  Future<void> updateStaffData(StaffData staffData) async {
    // await staffSQL.updateStaffByLogin2(staffData);
    await staffSQL.updateById(staffData);
  }

  // удалить сотрудника из DB
  Future<void> deleteStaffData(StaffData staffData) async {
    await staffSQL.deleteById(staffData);
  }

  // Начать слушать изменения в БД сотрудников
  void startListening() {
    _staffSubscription = staffSQL.watchAllStaff().listen((newStaffList) {
      // print('****');
      // print(newStaffList);
      add(ListenerDataDB(newStaffList));
    });
  }

  // Остановить прослушивание (обязательно!)
  void stopListening() {
    _staffSubscription?.cancel();
    _staffSubscription = null;
  }

  // void startListening({String sort = 'found'}) {
  //   switch (sort) {
  //     case 'found':
  //       {
  //         _storageSubscription =
  //             storageSql.watchAllStorage().listen((newStorageListSQL) {
  //           add(UpdateTableRecalculation(
  //               newList:
  //                   quickSortReversed(newStorageListSQL, (getKey) => getKey.found)));
  //         });
  //       }
  //     case 'barcode':
  //       {
  //         _storageSubscription =
  //             storageSql.watchAllStorage().listen((newStorageListSQL) {
  //           add(UpdateTableRecalculation(
  //               newList:
  //                   quickSort(newStorageListSQL, (getKey) => getKey.barcode)));
  //         });
  //       }
  //     case 'product':
  //       {
  //         _storageSubscription =
  //             storageSql.watchAllStorage().listen((newStorageListSQL) {
  //           add(UpdateTableRecalculation(
  //               newList:
  //                   quickSort(newStorageListSQL, (getKey) => (getKey.product))));
  //         });
  //       }
  //     case 'remainder':
  //       {
  //         _storageSubscription =
  //             storageSql.watchAllStorage().listen((newStorageListSQL) {
  //           add(UpdateTableRecalculation(
  //               newList:
  //                   quickSortByRemainder(newStorageListSQL)));
  //         });
  //       }
  //     // _storageSubscription =
  //     //     storageSql.watchAllStorage().listen((newStorageListSQL) {
  //     //   add(UpdateTableRecalculation(newList: newStorageListSQL));
  //     // });
  //   }
  // }
}


// final updatedList = state.staffDataList
//     .map((e) => e.id == updated.id ? updated : e)
//     .toList();

// emit(state.copyWith(staffDataList: updatedList));