import 'package:fastfood/DB/table/dishesDB.dart';
import 'package:fastfood/DB/table/storageBD.dart';
import 'package:fastfood/data_class/dishes_data.dart';
import 'package:fastfood/data_class/ingredient_data.dart';
import 'package:fastfood/data_class/storage_data.dart';
import 'package:fastfood/global_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'creating_dishes_event.dart';
part 'creating_dishes_state.dart';

class CreatingDishesBloc
    extends Bloc<CreatingDishesEvent, CreatingDishesState> {
  final StorageSQL storageSQL;
  final DishesSQL dishesSQL;

  CreatingDishesBloc({required this.storageSQL, required this.dishesSQL})
    : super(CreatingDishesInitial()) {
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

    // /* DishesInput Line */
    // on<DishesInput>((event, emit) {
    //   if (event.dishes != '') {
    //     List<String> newFilteredList = _foundToList(
    //       event.dishes,
    //       state.storageListSQL.map((toElement) => toElement.product).toList(),
    //     );
    //     emit(
    //       state.copyWith(dishes: event.dishes, filterDishes: newFilteredList),
    //     );
    //   } else {
    //     emit(state.copyWith(dishes: event.dishes, filterDishes: []));
    //   }
    // }, transformer: debounce<DishesInput>(const Duration(milliseconds: 250)));

    // on<PressDropDishes>((event, emit) {
    //   StorageData filterStorage = state.storageMapSQL[event.filterDishes]!;
    //   emit(
    //     state.copyWith(
    //       barcode: filterStorage.barcode != '' ? filterStorage.barcode : '',
    //       quantity: '1',
    //       product: filterStorage.product,
    //       measuring: filterStorage.measuring,
    //       price: filterStorage.price != null
    //           ? filterStorage.price.toString()
    //           : '',
    //       filterDishes: [],
    //     ),
    //   );
    // });

    /* ingredient Line */
    on<IngredientInput>(
      (event, emit) {
        if (event.ingredient != '') {
          List<String> newFilteredList = _foundToList(
            event.ingredient,
            state.storageListSQL.map((toElement) => toElement.product).toList(),
          );
          emit(
            state.copyWith(
              ingredientTitle: event.ingredient,
              filterIngredient: newFilteredList,
            ),
          );
        } else {
          emit(state.copyWith(filterIngredient: []));
        }
      },
      transformer: debounce<IngredientInput>(const Duration(milliseconds: 250)),
    );

    on<PressDropIngredient>((event, emit) {
      StorageData filterStorage = state.storageMapSQL[event.filterIngredient]!;
      // print(111);
      // print(filterStorage.measuring);
      emit(
        state.copyWith(
          // barcode: filterStorage.barcode != '' ? filterStorage.barcode : '',
          // quantity: '1',
          ingredientTitle: filterStorage.product,
          measuring: filterStorage.measuring,
          // price: filterStorage.price != null
          //     ? filterStorage.price.toString()
          //     : '',
          filterIngredient: [],
        ),
      );
    });
    /*  << ButtonInputIngredient >> */
    on<ButtonInputIngredient>((event, emit) {
      String title = changeInput();
      if (title.isNotEmpty) {
        showDialogOk(event.context, title, () {});
        // emit(state.copyWith(showTitle: ''));
      } else {
        if ((state.ingredientTitle) == false) {
          return showDialogOk(
            event.context,
            'В складе нет такого ингредиента!',
            () {},
          );
        } else {
          final CreatingDishesState newState = state.copyWith(
            ingredientsList: List.from(state.ingredientsList)
              ..add(
                IngredientData(
                  product: state.ingredientTitle,
                  barcode: state.storageMapSQL[state.ingredientTitle]?.barcode,
                  quantity: int.parse(state.quantity),
                  measuring: state.measuring == '' ? 'шт' : state.measuring,
                  // costPrice: double.parse(state.costPrice),
                  costPrice: state.storageMapSQL[state.ingredientTitle]?.price,
                ),
              ),
            ingredientTitle: '',
            quantity: '',
            measuring: 'шт',
          );
          emit(newState);
          add(UpdateTotal());
        }
      }
    });
    on<UpdateTotal>((event, emit) {
      double total = 0;
      state.ingredientsList.forEach((el) {
        total += el.quantity! * el.costPrice!;
      });
      emit(state.copyWith(costPrice: total.toString()));
    });

    on<UpdateIngredientList>((event, emit) {
      int index = event.index;
      // Создаем копию списка
      List<IngredientData> copyIngredientList = List.from(
        state.ingredientsList,
      );
      // Обновляем только нужное поле
      copyIngredientList[index] = event.newData;
      emit(state.copyWith(ingredientsList: copyIngredientList));
    });

    on<RemoveFromList>((event, emit) {
      List<IngredientData> newIngredientsList = List.from(state.ingredientsList)
        ..remove(event.data);
      emit(state.copyWith(ingredientsList: newIngredientsList));
      add(UpdateTotal());
    });

    /*  << ButtonCreateDishes >> */
    on<ButtonCreateDishes>((event, emit) {
      String title = changeDishes();
      if (title.isNotEmpty) {
        showDialogOk(event.context, title, () {});
      } else {
        // if (searchElement(state.ingredientTitle) == false) {
        //   return showDialogOk(
        //     event.context,
        //     'Нет такого блюда!',
        //     () {},
        //   );
        // }
        // else {
        
        List <DishesData> dishesList= [];
        for(IngredientData i in state.ingredientsList){
          dishesList.add(DishesData(
            nameDishes: state.dishes,
            product: i.product,
            quantity: i.quantity,
            measuring: i.measuring,
            price: double.parse(state.price),
            ));
        }
        dishesSQL.insertAllList(dishesList);
        final CreatingDishesState newState = state.copyWith(
          // ingredientsList: List.from(state.ingredientsList)
          //   ..add(
          //     IngredientData(
          //       product: state.ingredientTitle,
          //       barcode: state.storageMapSQL[state.ingredientTitle]?.barcode,
          //       quantity: int.parse(state.quantity),
          //       measuring: state.measuring == '' ? 'шт' : state.measuring,
          //       // costPrice: double.parse(state.costPrice),
          //       costPrice: state.storageMapSQL[state.ingredientTitle]?.price,
          //     ),
          //   ),
          dishes: '',
          pathMenu: '',
          costPrice: '',
          price: '',
          ingredientsList: [],
        );
        emit(newState);
        // add(UpdateTotal());
        // }
      }
    });
  }
  String changeInput() {
    // Проверка на пустое или пробельное название ингредиента
    if (state.ingredientTitle.trim().isEmpty) {
      return 'Введите ингредиент!';
    }
    // Проверка, что выбрано блюдо
    if (state.dishes.trim().isEmpty) {
      return 'Выберите блюдо!';
    }
    // Проверка, что введено количество
    if (state.quantity.trim().isEmpty) {
      return 'Введите количество!';
    }
    // Проверка на повторное введение ингредиента
    bool exists = state.ingredientsList.any(
      (i) => i.product == state.ingredientTitle,
    );
    if (exists) {
      return 'Этот ингредиент введен повторно!';
    }
    // Если все проверки пройдены успешно
    return '';
  }
  // String changeInput() {
  //   bool search = false;
  //   if (state.ingredientTitle.isNotEmpty) {
  //     for (IngredientData i in state.ingredientsList) {
  //       if (i.product == state.ingredientTitle) {
  //         search = true;
  //         // 'Этот  ингредиент введен повторно!';
  //       }
  //     }
  //   }
  //   if (state.ingredientTitle.isEmpty || state.ingredientTitle == ' ') {
  //     return 'Введите  ингредиент !';
  //   }
  //   else if (state.dishes.isEmpty || state.dishes == ' ') {
  //     return 'Выберите блюдо !';
  //   } else if (state.quantity.isEmpty) {
  //     return 'Введите количество !';
  //   } else {
  //     if(search){
  //       return 'Этот  ингредиент введен повторно!';
  //     }else{
  //       return '';
  //     }

  //   }
  // }

  String changeDishes() {
    /* */
    if (state.dishes.trim().isEmpty) {
      return 'Выберите блюдо !';
    } else if (state.price.isEmpty) {
      return 'Введите цену !';
    } else {
      return '';
    }
  }

  bool searchElement(searchElement) {
    // Элемент есть в базе !
    return state.storageMapSQL.containsKey(searchElement);
  }

  // bool searchDishes(searchElement) {
  //   // Элемент есть в базе !/*!!! */
  //   return state.storageMapSQL.containsKey(searchElement);
  // }
}

// Функция для поиска совпадений и создания списка
List<String> _foundToList(String value, List<String> foundList) {
  return foundList.where((it) => it.contains(value)).toList();
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
}
