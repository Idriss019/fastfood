import 'dart:async';

import 'package:fastfood/DB/table/storageBD.dart';
import 'package:fastfood/data_class/storage_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'storage_event.dart';
part 'storage_state.dart';

class StorageBloc extends Bloc<StorageEvent, StorageState> {
  final StorageSQL storageSQL;

  StreamSubscription? _staffSubscription;

  /* функции */
   // Начать слушать изменения в БД сотрудников
  void startListening() {
    _staffSubscription = storageSQL.watchAllStorage().listen((newStaffList) {
      add(UpdateState(state.copyWith(storageList: newStaffList)));
    });
  }

  // Остановить прослушивание (обязательно!)
  void stopListening() {
    _staffSubscription?.cancel();
    _staffSubscription = null;
  }

  // удалить сотрудника из DB
  Future<void> deleteStorageById(StorageData storageData) async {
    await storageSQL.deleteById(storageData);
  }

  StorageBloc({required this.storageSQL}) : super(StorageInitial()) {
    // Обновить стейт
    on<UpdateState>((event, emit) async {
      emit(event.state);
    });

    // on<StorageEvent>((event, emit) {
    // });

  }
}
