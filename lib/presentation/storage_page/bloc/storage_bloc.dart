import 'dart:async';

import 'package:fastfood/DB/table/storageBD.dart';
import 'package:fastfood/data_class/storage_data.dart';
import 'package:fastfood/global_function.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

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

  // Начать слушать изменения в БД сотрудников
  void startListeningSortByName() {
    _staffSubscription = storageSQL.watchAllStorage().listen((newStaffList) {
      add(
        UpdateState(
          state.copyWith(
            storageList: quickSort(newStaffList, (getKey) => getKey.product),
          ),
        ),
      );
    });
  }

  // Начать слушать изменения в БД сотрудников
  void startListeningSortByQuantity() {
    _staffSubscription = storageSQL.watchAllStorage().listen((newStaffList) {
      add(
        UpdateState(
          state.copyWith(
            storageList: quickSort(newStaffList, (getKey) => getKey.quantity),
          ),
        ),
      );
    });
  }

  // Начать слушать изменения в БД сотрудников
  void startListeningSortByFound() {
    _staffSubscription = storageSQL.watchAllStorage().listen((newStaffList) {
      add(
        UpdateState(
          state.copyWith(
            storageList: _foundToStorage(state.search, newStaffList),
          ),
        ),
      );
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

  // Функция для поиска совпадений и создания списка
  List<String> _foundToList(String value, List<String> foundList) {
    return foundList.where((it) => it.contains(value)).toList();
  }

  // Функция для поиска при полном совпадений и создания списка
  List<String> _foundFullToList(String value, List<String> foundList) {
    return foundList.where((it) => it == value).toList();
  }

  // Функция для поиска совпадений и создания списка
  List<StorageData> _foundToStorage(String value, List<StorageData> foundList) {
    return foundList.where((it) => it.product == value).toList();
  }

  /// События ***
  StorageBloc({required this.storageSQL}) : super(StorageInitial()) {
    // Обновить стейт
    on<UpdateState>((event, emit) async {
      emit(event.state);
    });

    on<SearchInput>((event, emit) {
      if (event.search != '') {
        List<String> newFilteredList = _foundToList(
          event.search,
          state.storageList
              .map((toElement) => toElement.product.toLowerCase())
              .toList(),
        );
        if (newFilteredList.isNotEmpty) {
          emit(
            state.copyWith(search: event.search, filterList: newFilteredList),
          );
        } else {
          newFilteredList = _foundFullToList(
            event.search,
            state.storageList
                .map((toElement) => toElement.barcode ?? '')
                .toList(),
          );
          // можно сразу внести изменения минуя filterList
          emit(
            state.copyWith(search: event.search, filterList: newFilteredList),
          );
        }
        // emit(state.copyWith(search: event.search, filterList: newFilteredList));
      } else {
        emit(state.copyWith(search: event.search, filterList: []));
      }
    }, transformer: debounce<SearchInput>(const Duration(milliseconds: 250)));
    // on<StorageEvent>((event, emit) {
    // });
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
}
