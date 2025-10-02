import 'package:fastfood/DB/table/purchasesDB.dart';
import 'package:fastfood/DB/table/storageBD.dart';
import 'package:fastfood/global_function.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:fastfood/data_class/purchases_data.dart';
import 'package:fastfood/data_class/storage_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'purchases_event.dart';
part 'purchases_state.dart';

class PurchasesBloc extends Bloc<PurchasesEvent, PurchasesState> {
  final PurchasesSql purchasesSql;
  final StorageSQL storageSQL;

  PurchasesBloc({required this.purchasesSql, required this.storageSQL})
    : super(PurchasesInitial()) {
    on<UpdataState>((event, emit) {
      final newState = event.pState;
      emit(newState);
    }, transformer: debounce<UpdataState>(const Duration(milliseconds: 350)));

    on<BarcodeInput>((event, emit) {
      final newState = state.copyWith(barcode: event.barcode);
      emit(newState);
      // поиск по штрих-коду
      bool search = false;
      for (StorageData sEl in state.storageListSQL) {
        if (sEl.barcode == event.barcode) {
          search = true;
          final newState = state.copyWith(
            barcode: event.barcode,
            product: sEl.product,
            quantity: '1',
            measuring: sEl.measuring,
            price: sEl.price != null ? sEl.price.toString() : '',
          );
          emit(newState);
          return;
        }
      }
      if (search == false) {
        emit(state.copyWith(barcode: event.barcode));
      }
      // print('barcode ${newState.barcode}');
    }, transformer: debounce<BarcodeInput>(const Duration(milliseconds: 250)));

    on<QuantityInput>((event, emit) {
      // PurchasesState newState = state;
      if (event.quantity.isNotEmpty) {
        // newState = state.copyWith(quantity: event.quantity);
        double? purchasesSum;
        double? purchases;
        double? priceSum;
        if (state.purchases.isNotEmpty) {
          double result =
              double.parse(event.quantity) * double.parse(state.purchases);
          purchasesSum = result;
        }
        if (state.purchasesSum.isNotEmpty) {
          double result =
              double.parse(state.purchasesSum) / double.parse(event.quantity);
          purchases = result;
        }
        if (state.price.isNotEmpty) {
          double result =
              double.parse(event.quantity) * double.parse(state.price);
          priceSum = result;
        }

        final newState = state.copyWith(
          quantity: event.quantity,
          purchasesSum: purchasesSum.toString() == 'null'
              ? ''
              : purchasesSum.toString(),
          purchases: purchases.toString() == 'null' ? '' : purchases.toString(),
          priceSum: priceSum.toString() == 'null' ? '' : priceSum.toString(),
        );
        emit(newState);
      } else {
        final newState = state.copyWith(quantity: event.quantity);
        emit(newState);
      }
    }, transformer: debounce<QuantityInput>(const Duration(milliseconds: 250)));

    // on<MeasuringInput>(
    //   (event, emit) {
    //     final newState = state.copyWith(measuring: event.measuring);
    //     emit(newState);
    //     print('measuring ${newState.measuring}');
    //   },
    //   transformer: debounce<MeasuringInput>(const Duration(milliseconds: 250)),
    // );
    /* Product Line */
    on<ProductInput>((event, emit) {
      if (event.product != '') {
        List<String> newFilteredList = _foundToList(
          event.product,
          state.storageListSQL.map((toElement) => toElement.product).toList(),
        );
        emit(
          state.copyWith(product: event.product, filterList: newFilteredList),
        );
      } else {
        emit(state.copyWith(product: event.product, filterList: []));
      }
    }, transformer: debounce<ProductInput>(const Duration(milliseconds: 250)));

    on<PurchasesInput>(
      (event, emit) {
        if (state.quantity.isNotEmpty && event.purchases.isNotEmpty) {
          double result =
              double.parse(event.purchases) * double.parse(state.quantity);
          final newState = state.copyWith(
            purchases: event.purchases,
            purchasesSum: result.toString(),
          );
          emit(newState);
        } else {
          final newState = state.copyWith(purchases: event.purchases);
          emit(newState);
        }
      },
      transformer: debounce<PurchasesInput>(const Duration(milliseconds: 350)),
    );

    on<PriceInput>((event, emit) {
      if (state.quantity.isNotEmpty &&
          event.price.isNotEmpty &&
          double.parse(event.price) > 0) {
        double result =
            double.parse(event.price) * double.parse(state.quantity);
        final newState = state.copyWith(
          price: event.price,
          priceSum: result.toString(),
        );
        emit(newState);
      } else {
        final newState = state.copyWith(price: event.price);
        emit(newState);
      }
    }, transformer: debounce<PriceInput>(const Duration(milliseconds: 350)));

    on<PurchasesSumInput>(
      (event, emit) {
        if (state.quantity.isNotEmpty && event.purchasesSum.isNotEmpty) {
          double result =
              double.parse(event.purchasesSum) / double.parse(state.quantity);
          final newState = state.copyWith(
            purchasesSum: event.purchasesSum,
            purchases: result.toString(),
          );
          emit(newState);
        } else {
          final newState = state.copyWith(purchasesSum: event.purchasesSum);
          emit(newState);
        }
      },
      transformer: debounce<PurchasesSumInput>(
        const Duration(milliseconds: 350),
      ),
    );

    // on<PriceSumInput>((event, emit) {
    //   final newState = state.copyWith(priceSum: event.priceSum);
    //   emit(newState);
    //   print('priceSum ${newState.priceSum}');
    // }, transformer: debounce<PriceSumInput>(const Duration(milliseconds: 350)));
    /*  << ButtonInput >> */
    on<ButtonInput>((event, emit) {
      String title = changeInput();
      if (title.isNotEmpty) {
        showDialogOk(event.context, title, () {});
        // emit(state.copyWith(showTitle: ''));
      } else {
        if (searchElement(state.product) == false) {
          showDialogOk(event.context, 'Обнаружен новый элемент!', () {});
        }
        // String newElement = searchNewElement();
        // if (newElement.isNotEmpty) {
        //   showDialogOk(event.context, newElement, () {});
        // }
        // String totalPurchases = updateTotal();
        // double totalPurchases = state.total != ''
        //     ? double.parse(state.total)
        //     : 0;
        // totalPurchases +=
        //     double.parse(state.quantity) * double.parse(state.purchases);

        // List<PurchasesData> newPurchasesList = state.purchasesList
        //     .map((item) => item)
        //     .toList();
        // PurchasesState newState = state;
        // bool newElementInsert = false;
        PurchasesState newState = state.copyWith(
          purchasesList: List.from(state.purchasesList)
            ..add(
              PurchasesData(
                id: 0,
                product: state.product,
                date: DateTime.now().millisecondsSinceEpoch,
                barcode: state.barcode,
                quantity: int.parse(state.quantity),
                measuring: state.measuring == '' ? 'шт' : state.measuring,
                priceOfPurchases: double.parse(state.purchases),
                price: double.parse(state.price),
              ),
            ),
          barcode: '',
          quantity: '',
          measuring: 'шт',
          product: '',
          purchases: '',
          price: '',
          purchasesSum: '',
          priceSum: '',
          // total: totalPurchases,
        );
        emit(newState);
        add(UpdateTotal());
        // for (int index = 0; index < newPurchasesList.length; index++) {
        //   final i = newPurchasesList[index];
        //   if (i.product == state.product) {
        //     newPurchasesList[index] = i.copyWith(
        //       quantity: i.quantity! + int.parse(state.quantity),
        //     );
        //     newElementInsert = true;
        //     newState = state.copyWith(
        //       purchasesList: newPurchasesList,
        //       barcode: '',
        //       quantity: '',
        //       measuring: 'шт',
        //       product: '',
        //       purchases: '',
        //       price: '',
        //       purchasesSum: '',
        //       priceSum: '',
        //       total: totalPurchases.toString(),
        //     );
        //     emit(newState);
        //   }
        // }
        // if (newElementInsert == false) {
        //   newState = state.copyWith(
        //     purchasesList: List.from(state.purchasesList)
        //       ..add(
        //         PurchasesData(
        //           id: 0,
        //           product: state.product,
        //           date: DateTime.now().millisecondsSinceEpoch,
        //           barcode: state.barcode,
        //           quantity: int.parse(state.quantity),
        //           measuring: state.measuring == '' ? 'шт' : state.measuring,
        //           priceOfPurchases: double.parse(state.purchases),
        //         ),
        //       ),
        //     barcode: '',
        //     quantity: '',
        //     measuring: 'шт',
        //     product: '',
        //     purchases: '',
        //     price: '',
        //     purchasesSum: '',
        //     priceSum: '',
        //     total: totalPurchases.toString(),
        //   );
        //   emit(newState);
      }
      // final newState = state.copyWith(
      //   purchasesList: List.from(state.purchasesList)
      //     ..add(
      //       PurchasesData(
      //         id: 0,
      //         product: state.product,
      //         date: DateTime.now().millisecondsSinceEpoch,
      //         barcode: state.barcode,
      //         quantity: int.parse(state.quantity),
      //         measuring: state.measuring == '' ? 'шт' : state.measuring,
      //         priceOfPurchases: double.parse(state.purchases),
      //       ),
      //     ),
      //   barcode: '',
      //   quantity: '',
      //   measuring: 'шт',
      //   product: '',
      //   purchases: '',
      //   price: '',
      //   purchasesSum: '',
      //   priceSum: '',
      //   total: totalPurchases.toString(),
      // );
      // emit(newState);
      // print('purchasesList ${newState.purchasesList}');
      // }
    });

    on<RemoveFromList>((event, emit) {
      List<PurchasesData> newPurchasesList = List.from(state.purchasesList)
        ..remove(event.data);
      emit(state.copyWith(purchasesList: newPurchasesList));
      add(UpdateTotal());
    });

    on<RemoveList>((event, emit) {
      emit(state.copyWith(purchasesList: [], total: ''));
    });

    /*  << InputList >> */
    on<InputList>((event, emit) async {
      await purchasesSql.insertAllList(state.purchasesList);
      insertOfStorage();
      emit(state.copyWith(purchasesList: [], total: ''));
    });

    on<UpdatePurchasesList>((event, emit) {
      int index = event.index;
      // Создаем копию списка
      List<PurchasesData> copyPurchasesList = List.from(state.purchasesList);
      // Обновляем только нужное поле
      copyPurchasesList[index] = event.newData;
      emit(state.copyWith(purchasesList: copyPurchasesList));
    });

    on<UpdateTotal>((event, emit) {
      double total = 0;
      state.purchasesList.forEach((el) {
        total += el.quantity! * el.priceOfPurchases!;
      });
      emit(state.copyWith(total: total.toString()));
    });

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

    on<PressDropList>((event, emit) {
      StorageData filterStorage = state.storageMapSQL[event.filter]!;
      emit(
        state.copyWith(
          barcode: filterStorage.barcode != '' ? filterStorage.barcode : '',
          quantity: '1',
          product: filterStorage.product,
          measuring: filterStorage.measuring,
          price: filterStorage.price != null
              ? filterStorage.price.toString()
              : '',
          filterList: [],
        ),
      );
    });

    // void _updatePurchasesList(PurchasesData element, PurchasesData newElement) {
    //   int index = state.purchasesList.indexOf(element);

    //   // Завершаем выполнение функции, если элемент не найден
    //   if (index == -1) {
    //     emit(state.copyWith(errorTitle: 'Элемент не найден в списке!'));
    //     return;
    //   }

    //   // Создаем копию списка
    //   List<PurchasesData> copyPurchasesList = List.from(state.purchasesList);

    //   // Обновляем только нужное поле
    //   copyPurchasesList[index] = newElement;

    //   emit(state.copyWith(purchasesList: copyPurchasesList));
    // }

    // on<TotalInput>((event, emit) {
    //   final newState = state.copyWith(priceSum: event.total);
    //   emit(newState);
    //   print('priceSum ${newState.total}');
    // }, transformer: debounce<TotalInput>(const Duration(milliseconds: 350)));
  }
  // void UpdataState<T>(T Function(PurchasesState) updateFunction) {
  //   final newState = updateFunction(state);

  //   emit(newState as PurchasesState);
  //   print('barcode ${state.barcode}');
  // }
  String changeInput() {
    if (state.quantity.isEmpty) {
      return 'Ведите количество !';
    } else if (state.product.isEmpty || state.product == ' ') {
      return 'Ведите  название !';
    } else if (state.purchases.isEmpty) {
      return 'Ведите цену закупа !';
    } else if (state.price.isEmpty) {
      return 'Ведите цену продажи !';
    } 
    // else if (int.tryParse(state.quantity) == null) {
    //   return 'Ведите цену закупа !';
    // }
    else {
      return '';
    }
  }

  bool searchElement(searchElement) {
    // Элемент есть в базе !
    return state.storageMapSQL.containsKey(searchElement);
    // for (StorageData sE in state.storageListSQL) {
    //   if (sE.product == state.product) {
    //     return '';
    //   }
    // }
    // return 'Обнаружен новый элемент!';
  }

  insertOfStorage() {
    List<StorageData> newElements = [];
    List<StorageData> updateElements = [];
    for (int index = 0; index < state.purchasesList.length; index++) {
      final purEl = state.purchasesList[index];
      if (searchElement(purEl.product)) {
        updateElements.add(
          StorageData(
            id: index,
            product: purEl.product.toLowerCase(),
            barcode: purEl.barcode,
            quantity:
                state.storageMapSQL[purEl.product]!.quantity + purEl.quantity!,
            measuring: purEl.measuring == '' ? 'шт' : purEl.measuring ?? 'шт',
            price: purEl.price,
          ),
        );
      } else {
        newElements.add(
          StorageData(
            id: index,
            product: purEl.product.toLowerCase(),
            barcode: purEl.barcode,
            quantity: purEl.quantity!,
            measuring: purEl.measuring == '' ? 'шт' : purEl.measuring ?? 'шт',
            price: purEl.price,
          ),
        );
      }
    }
    storageSQL.insertAllList(newElements);
    storageSQL.updateByProductClass(updateElements);
    add(UpdataStorageData());
  }

  // Функция для поиска совпадений и создания списка
  List<String> _foundToList(String value, List<String> foundList) {
    // state.filterList.clear();
    // print(object)
    // emit(state.copyWith(filterList: []));
    return foundList.where((it) => it.contains(value)).toList();
  }

  // if (searchElement() == false) {
  //   storageSQL.insert(
  //     StorageData(
  //       id: 0,
  //       product: element.product,
  //       barcode: element.barcode,
  //       quantity: 0,
  //       measuring: element.measuring == '' ? 'шт' : element.measuring,
  //       priceOfPurchases: 0,
  //       priceOfSales: 0,
  //     ),
  //   );
  // }
  // });
  // }
  // Future<void> updataStorageData() async {
  //   Map<String, StorageData> newStorageMapSQL = {};
  //   List<StorageData> newStorageListSQL = await storageSQL.selectAll();
  //   for (StorageData i in newStorageListSQL) {
  //     newStorageMapSQL[i.product] = i;
  //   }
  //   add(
  //     UpdataState(
  //       pState: state.copyWith(
  //         storageMapSQL: newStorageMapSQL,
  //         storageListSQL: newStorageListSQL,
  //       ),
  //     ),
  //   );
  // }

  // Future<void> updateStorageData() async { !!!print(map.containsKey(2));
  //   add(
  //     UpdataState(
  //       pState: state.copyWith(storageListSQL: await storageSQL.selectAll()),
  //     ),
  //   );
  //   add(
  //     UpdataState(
  //       pState: state.copyWith(
  //         storageMapSQL: Map.fromIterable(
  //           state.storageListSQL,
  //           key: (item) => item.product,
  //           value: (item) => item,
  //         ),
  //       ),
  //     ),
  //   );
  //   // emit(state.copyWith(storageListSQL: await storageSQL.selectAll()));
  // }

  // Map<String, Data> dataMap = Map.fromIterable(
  //   dataList,
  //   key: (item) => item.product,
  //   value: (item) => item,
  // );

  //   void updateTotal() {
  //   double total = 0;
  //   state.purchasesList.forEach((el) {
  //     total += el.quantity! * el.priceOfPurchases!;
  //   });
  //   // Обновляем состояние через emit
  //   emit(state.copyWith(total: total.toString()));
  // }
  // void updateTotal() {
  //   double total = 0;
  //   state.purchasesList.forEach((el) {
  //     total += el.quantity! * el.priceOfPurchases!;
  //   });
  //   add(UpdataState(pState: state.copyWith(total: total.toString())));
  // }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
}
