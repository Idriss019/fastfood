import 'package:rxdart/rxdart.dart';
import 'package:fastfood/data_class/purchases_data.dart';
import 'package:fastfood/data_class/storage_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'purchases_event.dart';
part 'purchases_state.dart';

class PurchasesBloc extends Bloc<PurchasesEvent, PurchasesState> {
  PurchasesBloc() : super(PurchasesInitial()) {
    on<BarcodeInput>((event, emit) {
      final newState = state.copyWith(barcode: event.barcode);
      emit(newState);
      print('barcode ${newState.barcode}');
    }, transformer: debounce<BarcodeInput>(const Duration(milliseconds: 250)));

    on<QuantityInput>((event, emit) {
      final newState = state.copyWith(quantity: event.quantity);
      emit(newState);
      print('quantity ${newState.quantity}');
    }, transformer: debounce<QuantityInput>(const Duration(milliseconds: 250)));

    on<MeasuringInput>(
      (event, emit) {
        final newState = state.copyWith(measuring: event.measuring);
        emit(newState);
        print('measuring ${newState.measuring}');
      },
      transformer: debounce<MeasuringInput>(const Duration(milliseconds: 250)),
    );

    on<ProductInput>((event, emit) {
      // final bloc = event.context.watch<StorageCubit>().state.storageList;
      // print('qqqq'); final bloc = context.watch<StorageCubit>();
      // _foundToList(event.product,
      //     event.list.map((toElement) => toElement.product).toList());
      // /// Исправить это фигню
      // List<String> _foundList = blocStorage.state.storageList
      //     .map((toElement) => toElement.product)
      //     .toList();
      // state.foundToList(event.product, foundList);
      final newState = state.copyWith(product: event.product);
      emit(newState);
      print('product ${newState.product}');
      // print('purchases ${newState.purchases}');
    }, transformer: debounce<ProductInput>(const Duration(milliseconds: 250)));

    on<PurchasesInput>(
      (event, emit) {
        final newState = state.copyWith(purchases: event.purchases);
        emit(newState);
        print('purchases ${newState.purchases}');
      },
      transformer: debounce<PurchasesInput>(const Duration(milliseconds: 350)),
    );

    on<PriceInput>((event, emit) {
      final newState = state.copyWith(price: event.price);
      emit(newState);
      print('price ${newState.price}');
    }, transformer: debounce<PriceInput>(const Duration(milliseconds: 350)));

    on<PurchasesSumInput>(
      (event, emit) {
        final newState = state.copyWith(purchasesSum: event.purchasesSum);
        emit(newState);
        print('purchasesSum ${newState.purchasesSum}');
      },
      transformer: debounce<PurchasesSumInput>(
        const Duration(milliseconds: 350),
      ),
    );

    on<PriceSumInput>((event, emit) {
      final newState = state.copyWith(priceSum: event.priceSum);
      emit(newState);
      print('priceSum ${newState.priceSum}');
    }, transformer: debounce<PriceSumInput>(const Duration(milliseconds: 350)));

    on<ButtonInput>((event, emit) {
      double totalPurchases = state.total != '' ? double.parse(state.total) : 0;
      totalPurchases +=
          double.parse(state.quantity) * double.parse(state.purchases);
      final newState = state.copyWith(
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
        total: totalPurchases.toString()
      );
      emit(newState);
      print('purchasesList ${newState.purchasesList}');
    });
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
}
