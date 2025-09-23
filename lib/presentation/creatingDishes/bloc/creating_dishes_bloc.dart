import 'package:fastfood/DB/table/storageBD.dart';
import 'package:fastfood/data_class/dishes_data.dart';
import 'package:fastfood/data_class/storage_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'creating_dishes_event.dart';
part 'creating_dishes_state.dart';

class CreatingDishesBloc extends Bloc<CreatingDishesEvent, CreatingDishesState> {
  final StorageSQL storageSQL;

  CreatingDishesBloc({required this.storageSQL}) : super(CreatingDishesInitial()) {
    

    on<UpdataState>((event, emit) {
      final newState = event.pState;
      emit(newState);
    }, transformer: debounce<UpdataState>(const Duration(milliseconds: 350)));

    on<UpdataStorageData>((event, emit) async {
      Map<String, StorageData> newStorageMapSQL = {};
      List<StorageData> newStorageListSQL = await storageSQL.selectAll();
      for (StorageData i in newStorageListSQL) {
        newStorageMapSQL[i.product] = i;
      }
      emit(
        state.copyWith(
          storageMapSQL: newStorageMapSQL,
          storageListSQL: newStorageListSQL,
        ),
      );
    });
  }
}
EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
}