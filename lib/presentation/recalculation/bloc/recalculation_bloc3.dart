// import 'dart:async';

// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:vitamin_opt_5/data/dataClass/storage_data.dart';
// import 'package:vitamin_opt_5/data/db/database.dart';
// import 'package:vitamin_opt_5/data/db/tables/storageTable.dart';
// import 'package:vitamin_opt_5/globalFunction.dart';

// part 'recalculation_event.dart';
// part 'recalculation_state.dart';

// class RecalculationBloc extends Bloc<RecalculationEvent, RecalculationState> {
//   Timer? _debounce;
//   final StorageSQL storageSql;
//   StreamSubscription<List<StorageData>>? _storageSubscription;
//   RecalculationBloc({
//     required RecalculationState initialState,
//     required this.storageSql,
//   }) : super(initialState) {
//     // on<GetLists>((event, emit) async {
//     //   // Map<String, StorageData> nemBarcodeList = {};
//     //   // // List<StorageData> newListStorage = [];
//     //   // // Stream<List<StorageData>> newListStorage = storageSql.watchAllStorage();
//     //   // // List<StorageData>  newListStorage;
//     //   // // storageSql.watchAllStorage().listen((list)=> newListStorage = list);
//     //   // // print('object');
//     //   // // print(newListStorage!);
//     //   // // storageSql.watchAllStorage().listen((newStorageListSQL) {
//     //   // //   try {
//     //   // //     emit(state.copyWith(
//     //   // //       tableRecalculation: newStorageListSQL,
//     //   // //     ));
//     //   // //   } catch (e) {
//     //   // //     print(e);
//     //   // //   }
//     //   // // });
//     //   // for (StorageData i in await storageSql.selectAll()) {
//     //   //   // print('object1');
//     //   //   // newListStorage.add(i);
//     //   //   if (i.barcode != null && i.barcode != '') {
//     //   //     // print('object2');
//     //   //     nemBarcodeList.addAll({i.barcode!: i});
//     //   //     // print(nemBarcodeList);
//     //   //   }
//     //   // }
//     //   print('object3');
//     //   print(getBarcodeMap());
//     //   emit(state.copyWith(
//     //     barcodeList: getBarcodeMap(),
//     //     // tableRecalculation: newListStorage,
//     //   ));
//     //   // print(state.barcodeList);
//     // });

//     on<SearchByInput>((event, emit) async {
//       // print(event.title);
//       emit(state.copyWith(search: event.title));
//       List<String> filterStorageList = [];
//       state.tableRecalculation.forEach((action) {
//         if (action.product.contains(event.title) &&
//             action.found != action.quantity) {
//           // print('${action.product} ${action.found} === ${action.quantity}');
//           filterStorageList.add(action.product);
//         }
//       });
//       _foundToList(
//         event.title,
//         filterStorageList,
//       );
//       if (state.barcodeList.containsKey(event.title)) {
//         StorageData searchStorageData = state.barcodeList[event.title]!;
//         // print('object1');
//         int lastFound = searchStorageData.found!;
//         if (state.quantity.isEmpty) {
//           // print('object1');
//           await storageSql.updateByProduct(
//               product: searchStorageData.product, found: lastFound + 1);
//           // print('WWWW');
//           // print(lastFound);
//           StorageData newFound =
//               searchStorageData.copyWith(found: lastFound + 1);
//           state.barcodeList[event.title] = newFound;
//           // print('EEEEE');
//           // print(newFound.found);
//           // print(state.barcodeList[event.title]!.found);
//           // Map<String, StorageData> newMap = state.barcodeList;
//           // ///////
//           // newMap[event.title]!.copyWith(found: searchStorageData.found);
//           // print('QQQQ');
//           // print(newMap[event.title]!.found);
//           // state.tableRecalculation.forEach((element) {
//           //   if (element.product == searchStorageData.product) {
//           //     element = searchStorageData;
//           //   }
//           // });
//           emit(state.copyWith(
//             heightTable: 0,
//             search: '',
//             quantity: '1',
//             barcode: searchStorageData.barcode,
//             product: searchStorageData.product,
//             total: searchStorageData.quantity!.toString(),
//             calculated: (searchStorageData.found! + 1).toString(),
//             remainder:
//                 (searchStorageData.quantity! - (lastFound + 1)).toString(),
//             // barcodeList: state.barcodeList,
//             lastInput: searchStorageData,
//             // tableRecalculation: state.tableRecalculation,
//           ));
//         }
//         if (state.quantity.isNotEmpty) {
//           // print('object2');
//           // print(lastFound + int.parse(state.quantity));
//           await storageSql.updateByProduct(
//               product: searchStorageData.product,
//               found: lastFound + int.parse(state.quantity));
//           StorageData newFound = searchStorageData.copyWith(
//               found: lastFound + int.parse(state.quantity));
//           state.barcodeList[event.title] = newFound;
//           emit(state.copyWith(
//               heightTable: 0,
//               search: '',
//               barcode: searchStorageData.barcode,
//               product: searchStorageData.product,
//               total: searchStorageData.quantity.toString(),
//               calculated: (lastFound + int.parse(state.quantity)).toString(),
//               remainder: (searchStorageData.quantity! -
//                       (lastFound + int.parse(state.quantity)))
//                   .toString(),
//               // barcodeList: state.barcodeList,
//               lastInput: searchStorageData));
//         }
//       }
//       if (state.barcodeList.containsKey(event.title) == false) {
//         // print('object3');
//         emit(state.copyWith(
//           barcode: '-',
//           product: 'Не найдено!',
//           total: '0',
//           calculated: '0',
//           remainder: '0',
//         ));
//       }
//     }, transformer: debounce<SearchByInput>(const Duration(milliseconds: 250)));

//     on<UpdateTableRecalculation>((event, emit) {
//       Map<String, StorageData> nemBarcodeList = {};
//         // print('Getbarcode');
//         for (StorageData i in event.newList) {
//           // print('object1');
//           // newListStorage.add(i);
//           if (i.barcode != null && i.barcode != '') {
//             // print('object2');
//             nemBarcodeList.addAll({i.barcode!: i});
//             // print(nemBarcodeList);
//           }
//         }
//       emit(state.copyWith(
//         barcodeList: nemBarcodeList,
//         tableRecalculation: event.newList,
//       ));
//       // print(state.barcodeList);
//     });

//     on<PressDropList>(
//       (event, emit) async {
//         StorageData searchItem = event.sData.firstWhere(
//           (it) => it.product == event.foundItem,
//           orElse: () => StorageData(id: 0, product: 'Не найдено!'),
//         );
//         int lastFound = searchItem.found!;
//         if (state.quantity.isEmpty) {
//           // print('object1');
//           await storageSql.updateByProduct(
//               product: searchItem.product, found: lastFound + 1);
//           StorageData newFound = searchItem.copyWith(found: lastFound + 1);
//           if (searchItem.barcode != null) {
//             state.barcodeList[searchItem.barcode!] = newFound;
//           }
//           emit(state.copyWith(
//               heightTable: 0,
//               search: '',
//               quantity: '1',
//               barcode: searchItem.barcode,
//               product: searchItem.product,
//               total: searchItem.quantity.toString(),
//               calculated: (searchItem.found! + 1).toString(),
//               remainder: (searchItem.quantity! - (lastFound + 1)).toString(),
//               // barcodeList: state.barcodeList,
//               lastInput: searchItem));
//         }
//         if (state.quantity.isNotEmpty) {
//           await storageSql.updateByProduct(
//               product: searchItem.product,
//               found: lastFound + int.parse(state.quantity));
//           // print('object2');
//           StorageData newFound = searchItem.copyWith(found: lastFound + 1);
//           if (searchItem.barcode != null) {
//             state.barcodeList[searchItem.barcode!] = newFound;
//           }
//           emit(state.copyWith(
//               heightTable: 0,
//               search: '',
//               barcode: searchItem.barcode,
//               product: searchItem.product,
//               total: searchItem.quantity.toString(),
//               calculated: (lastFound + int.parse(state.quantity)).toString(),
//               remainder: (searchItem.quantity! -
//                       (lastFound + int.parse(state.quantity)))
//                   .toString(),
//               // barcodeList: state.barcodeList,
//               lastInput: searchItem));
//         }
//       },
//     );

//     on<QuantityInput>((event, emit) {
//       emit(state.copyWith(quantity: event.quantity));
//       // print(sum);
//     }, transformer: debounce<QuantityInput>(const Duration(milliseconds: 250)));

//     // on<LoadFromSQL>(
//     //   (event, emit) {
//     //     storageSql.watchAllStorage().listen((newStorageListSQL) {
//     //       try {
//     //         emit(state.copyWith(
//     //           tableRecalculation: newStorageListSQL,
//     //         ));
//     //       } catch (e) {
//     //         print(e);
//     //       }
//     //     });
//     //   },
//     // );
//     on<CancelButtonEvent>((event, emit) async {
//       await storageSql.updateByProductClass(table: state.lastInput);
//       if (state.lastInput.barcode != null) {
//         state.barcodeList[state.lastInput.barcode!] = state.lastInput;
//       }
//       emit(state.copyWith(
//         // barcodeList: state.barcodeList,
//         quantity: '1',
//         barcode: '',
//         product: '',
//         total: '',
//         calculated: '',
//         remainder: '',
//       ));
//     });
//     on<ResetFound>((event, emit) async {
//       await storageSql.updateByProduct(product: event.product, found: 0);
//       if (event.barcode.isNotEmpty) {
//         StorageData newStorage =
//             state.barcodeList[event.barcode]!.copyWith(found: 0);
//         state.barcodeList[event.barcode] = newStorage;
//       }
//       // state.barcodeList.update(barcode, (_) => updatedStorage);
//       // emit(state.copyWith(
//       //   barcodeList: state.barcodeList,
//       // ));
//     });

//     on<UpdateFound>((event, emit) async {
//       if (event.sData.found! > event.sData.quantity!) {
//         // print('Error');
//         return changeMessage(event.context, "Ошибка! Превышен лимит!");
//       }

//       // print('Active');
//       Navigator.pop(event.context);
//       await storageSql.updateByProductClass(table: event.sData);
//       String barcode = event.sData.barcode ?? '';
//       if (barcode != '') {
//         state.barcodeList[barcode] = event.sData;
//         // emit(state.copyWith(
//         //   barcodeList: state.barcodeList,
//         // ));
//       }
//     });
//     on<ResetAllCounts>((event, emit) async {
//       await showCustomDialog(
//           event.context, 'Вы уверенны что хотите сбрось весь подсчет?',
//           () async {
//         // /* из бд обновить у всех фоунд */
//         // print('UUU');
//         await storageSql.updateFoundByProduct(state.tableRecalculation);
//         // print('VVV');
//       });
//       // emit(state.copyWith(barcodeList: getBarcodeMap()));
//     });
//   }

//   EventTransformer<T> debounce<T>(Duration duration) {
//     return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
//   }

//   // Map<String, StorageData> getBarcodeMap() {
//   //   Map<String, StorageData> nemBarcodeList = {};
//   //   print('Getbarcode');
//   //   print(state.tableRecalculation);
//   //   for (StorageData i in state.tableRecalculation) {
//   //     // print('object1');
//   //     // newListStorage.add(i);
//   //     if (i.barcode != null && i.barcode != '') {
//   //       // print('object2');
//   //       nemBarcodeList.addAll({i.barcode!: i});
//   //       // print(nemBarcodeList);
//   //     }
//   //   }
//   //   return nemBarcodeList;
//   // }

//   void changeMessage(BuildContext context, String title) {
//     // print('Active 2');
//     if (title.isNotEmpty) {
//       // print('isNotEmpty');
//       showDialogOk(context, title, () {
//         // emit(state.copyWith(
//         //   messageBloc: '',
//         // ));
//         // Navigator.pop(context);
//       });
//     } else {
//       // print('isEmpty');
//       Navigator.pop(context);
//     }
//   }

//   void startListening() {
//     _storageSubscription =
//         storageSql.watchAllStorage().listen((newStorageListSQL) {
//       add(UpdateTableRecalculation(newList: newStorageListSQL));
//     });
//   }

//   void cancelListening() {
//     _storageSubscription?.cancel();
//   }

//   // Функция для поиска совпадений и создания списка
//   void _foundToList(String value, List<String> foundList) {
//     // state.filterList.clear();
//     // print(object)
//     // emit(state.copyWith(filterList: []));
//     List<String> newFilterList =
//         foundList.where((it) => it.contains(value)).toList();

//     // Регулировка высоты таблицы
//     if (newFilterList.length > 5) {
//       // print('11');
//       final newState = state.copyWith(
//           filterList: newFilterList, heightTable: state.heightContainer * 5);
//       emit(newState);
//     } else if (newFilterList.length < 5) {
//       // print('22');
//       double heightTable =
//           state.heightContainer * newFilterList.length.toDouble();
//       // print(state.heightContainer * state.filterList.length.toDouble());
//       // print(heightT);
//       //  print(newFilterList.length);
//       final newState =
//           state.copyWith(filterList: newFilterList, heightTable: heightTable);
//       emit(newState);
//       // print('xxxx');
//       // print(state.heightContainer * state.filterList.length.toDouble()); //state.heightTable);
//     }
//     if (value.isEmpty || newFilterList.isEmpty) {
//       // print('33');
//       final newState =
//           state.copyWith(filterList: newFilterList, heightTable: 0);
//       emit(newState);
//     }
//   }
// }
