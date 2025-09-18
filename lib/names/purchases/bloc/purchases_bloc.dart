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
    on<UpdateLine>((event, emit) {
      final newState = event.pState;
      emit(newState);
    }, transformer: debounce<UpdateLine>(const Duration(milliseconds: 350)));

    on<BarcodeInput>((event, emit) {
      final newState = state.copyWith(barcode: event.barcode);
      emit(newState);
      print('barcode ${newState.barcode}');
    }, transformer: debounce<BarcodeInput>(const Duration(milliseconds: 250)));

    on<QuantityInput>((event, emit) {
      // PurchasesState newState = state;

      if (event.quantity.isNotEmpty) {
        // newState = state.copyWith(quantity: event.quantity);
        double? purchasesSum;
        double? purchases;
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

        final newState = state.copyWith(
          quantity: event.quantity,
          purchasesSum: purchasesSum.toString() == 'null'
              ? ''
              : purchasesSum.toString(),
          purchases: purchases.toString() == 'null' ? '' : purchases.toString(),
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

    // on<ProductInput>((event, emit) {
    //   // final bloc = event.context.watch<StorageCubit>().state.storageList;
    //   // print('qqqq'); final bloc = context.watch<StorageCubit>();
    //   // _foundToList(event.product,
    //   //     event.list.map((toElement) => toElement.product).toList());
    //   // /// Исправить это фигню
    //   // List<String> _foundList = blocStorage.state.storageList
    //   //     .map((toElement) => toElement.product)
    //   //     .toList();
    //   // state.foundToList(event.product, foundList);
    //   final newState = state.copyWith(product: event.product);
    //   emit(newState);
    //   print('product ${newState.product}');
    //   // print('purchases ${newState.purchases}');
    // }, transformer: debounce<ProductInput>(const Duration(milliseconds: 250)));

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

    on<ButtonInput>((event, emit) {
      String title = changeInput();
      if (title.isNotEmpty) {
        showDialogOk(event.context, title, () {});
        // emit(state.copyWith(showTitle: ''));
      } else {
        String newElement = searchNewElement();
        if (newElement.isNotEmpty) {
          showDialogOk(event.context, newElement, () {});
        }
        double totalPurchases = state.total != ''
            ? double.parse(state.total)
            : 0;
        totalPurchases +=
            double.parse(state.quantity) * double.parse(state.purchases);
        List<PurchasesData> newPurchasesList = state.purchasesList
            .map((item) => item)
            .toList();
        PurchasesState newState = state;
        bool newElementInsert = false;
        for (int index = 0; index < newPurchasesList.length; index++) {
          final i = newPurchasesList[index];
          if (i.product == state.product) {
            newPurchasesList[index] = i.copyWith(
              quantity: i.quantity! + int.parse(state.quantity),
            );
            newElementInsert = true;
            newState = state.copyWith(
              purchasesList: newPurchasesList,
              barcode: '',
              quantity: '',
              measuring: 'шт',
              product: '',
              purchases: '',
              price: '',
              purchasesSum: '',
              priceSum: '',
              total: totalPurchases.toString(),
            );
            emit(newState);
          }
        }
        if (newElementInsert == false) {
          newState = state.copyWith(
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
            total: totalPurchases.toString(),
          );
          emit(newState);
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
      }
    });

    on<RemoveFromList>((event, emit) {
      double totalPurchases = double.parse(state.total);
      // totalPurchases += 100;
      totalPurchases -= event.data.quantity! * event.data.priceOfPurchases!;
      List<PurchasesData> newPurchasesList = List.from(state.purchasesList)
        ..remove(event.data);
      emit(
        state.copyWith(
          purchasesList: newPurchasesList,
          total: totalPurchases.toString(),
        ),
      );
    });

    on<RemoveList>((event, emit) {
      emit(state.copyWith(purchasesList: [], total: ''));
    });

    on<InputList>((event, emit) async {
      await purchasesSql.insertAllList(state.purchasesList);
      emit(state.copyWith(purchasesList: [], total: ''));
    });
    // on<TotalInput>((event, emit) {
    //   final newState = state.copyWith(priceSum: event.total);
    //   emit(newState);
    //   print('priceSum ${newState.total}');
    // }, transformer: debounce<TotalInput>(const Duration(milliseconds: 350)));
  }
  // void updateLine<T>(T Function(PurchasesState) updateFunction) {
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
    } else if (state.purchases.isEmpty) {
      return 'Ведите цену закупа !';
    } else {
      return '';
    }
  }

  String searchNewElement() {
    for (StorageData sE in state.storageListSQL) {
      if (sE.product == state.product) {
        return '';
      }
    }
    return 'Обнаружен новый элемент!';
  }

  Future<void> loadStorageList() async {
    emit(state.copyWith(storageListSQL: await storageSQL.selectAll()));
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
}
