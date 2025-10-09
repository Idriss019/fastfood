import 'package:fastfood/DB/table/dishesDB.dart';
import 'package:fastfood/DB/table/storageBD.dart';
import 'package:fastfood/data_class/dishes_data.dart';
import 'package:fastfood/data_class/ingredient_data.dart';
import 'package:fastfood/data_class/storage_data.dart';
import 'package:fastfood/global_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_widgets/my_widgets.dart';
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

    on<UpdataDishesData>((event, emit) async {
      List<DishesData> newDishesList = await dishesSQL.getAll();
      emit(state.copyWith(dishesListSQL: newDishesList));
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
    /* Dishes Line */
    on<DishesInput>((event, emit) {
      if (event.dishes != '') {
        List<DishesData> newIngredientList = [];
        // List<DishesData> newIngredientList = state.dishesListSQL
        //     .where((toElement) => toElement.nameDishes == event.dishes)
        //     .toList();
        for (DishesData i in state.dishesListSQL) {
          if (i.nameDishes == event.dishes.toLowerCase()) {
            newIngredientList.add(i);
          }
        }
        if (newIngredientList.isNotEmpty) {
          emit(
            state.copyWith(
              dishes: event.dishes,
              pathMenu: event.path,
              ingredientsList: newIngredientList,
              price: newIngredientList[0].priceDishes.toString(),
            ),
          );
          add(UpdateTotal());
        } else {
          emit(
            state.copyWith(
              dishes: event.dishes,
              pathMenu: event.path,
              ingredientsList: [],
            ),
          );
        }
      }
    });

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
                DishesData(
                  nameDishes: state.dishes,
                  product: state.ingredientTitle,
                  // barcode: state.storageMapSQL[state.ingredientTitle]?.barcode,
                  quantity: int.parse(state.quantity),
                  measuring: state.measuring == '' ? 'шт' : state.measuring,
                  // costPrice: double.parse(state.costPrice),
                  costPriceProduct:
                      state.storageMapSQL[state.ingredientTitle]?.costPrice,
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
        total += el.quantity! * el.costPriceProduct!;
      });
      emit(state.copyWith(costPrice: total.toString()));
    });

    on<UpdateIngredientList>((event, emit) {
      int index = event.index;
      // Создаем копию списка
      List<DishesData> copyIngredientList = List.from(state.ingredientsList);
      // Обновляем только нужное поле
      copyIngredientList[index] = event.newData;
      emit(state.copyWith(ingredientsList: copyIngredientList));
    });

    on<RemoveFromList>((event, emit) {
      List<DishesData> newIngredientsList = List.from(state.ingredientsList)
        ..remove(event.data);
      emit(state.copyWith(ingredientsList: newIngredientsList));
      add(UpdateTotal());
    });

    on<PressMenuItem>((event, emit) async {
      // List<DishesData> getDishesList = await dishesSQL.getAll();
      // List<IngredientData> newIngredientsList = getDishesList.map((e) => ,).toList();
      // emit(state.copyWith(ingredientsList: newIngredientsList));
      add(UpdateTotal());
    });

    /*  << ButtonCreateDishes >> */
    on<ButtonCreateDishes>((event, emit) async {
      bool createDishes =
          await showDialog<bool>(
            context: event.context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  'Это действие создаст блюдо и удалит все прошлые ингредиенты. Вы уверенны ?',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text('Отмена'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text('ОК'),
                  ),
                ],
              );
            },
          ) ??
          false;
      if (createDishes) {
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

          // List<DishesData> dishesList = [];
          // for(DishesData i in state.ingredientsList){
          //   dishesList.add(DishesData(
          //     nameDishes: state.dishes,
          //     product: i.product,
          //     quantity: i.quantity,
          //     measuring: i.measuring,
          //     price: double.parse(state.price),
          //     ));
          // }
          // List<DishesData> dishesList = [];
          // for (DishesData i in state.ingredientsList) {
          //   dishesList.add(
          //     i.copyWith(
          //       nameDishes: state.dishes,
          //       priceDishes: double.parse(state.price),
          //     ),
          //   );/***************** */
          // }
          // удалить из базы !
          dishesSQL.deleteByDishes(state.dishes.toLowerCase());
          List<DishesData> dishesList = state.ingredientsList
              .map(
                (toElement) => toElement.copyWith(
                  nameDishes: state.dishes,
                  priceDishes: double.parse(state.price),
                ),
              )
              .toList();
          dishesSQL.insertAllList(dishesList);
          final CreatingDishesState newState = state.copyWith(
            dishes: '',
            pathMenu: '',
            costPrice: '',
            price: '',
            ingredientsList: [],
          );
          emit(newState);
        }
        add(UpdataDishesData());
      }
    });
    /* Переименовать блюдо */
    on<RenameDishes>((event, emit) async {
      String title = changeDishesEasy();
      if (title.isNotEmpty) {
        showDialogOk(event.context, title, () {});
      } else {
        String? newName = await showDialog<String>(
          context: event.context,
          builder: (context) {
            String tempName = state.dishes;
            return AlertDialog(
              title: Text('Переименовать : $tempName?'),
              content: TextField(
                autofocus: true,
                decoration: InputDecoration(hintText: 'Новое имя'),
                controller: TextEditingController(text: tempName),
                onChanged: (value) => tempName = value,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, null),
                  child: Text('Отмена'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, tempName),
                  child: Text('ОК'),
                ),
              ],
            );
          },
        );
        if (newName != null && newName.isNotEmpty) {
          dishesSQL.renameDishes(
            oldDishes: state.dishes.toLowerCase(),
            newDishes: newName.toLowerCase(),
          );
          add(UpdataDishesData());
          // переименовать в Json файле
          event.menuItem.renameByPath(
            state.pathMenu,
            newName,
            directory: false,
          );
          // Автоматическое сохранение после переименования
          DirectoryFilesUtils.saveMenuToFile(event.menuItem, event.filePath);

          emit(
            state.copyWith(
              ingredientsList: [],
              dishes: '',
              pathMenu: '',
              price: '',
            ),
          );
          event.func();
          // print('Rename');
        }
      }
    });
    /* Удалить блюдо */
    on<DeleteDishes>((event, emit) async {
      String title = changeDishesEasy();
      if (title.isNotEmpty) {
        showDialogOk(event.context, title, () {});
      } else {
        String dishesName = state.dishes;
        bool deleteDishes =
            await showDialog<bool>(
              context: event.context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Удалить : $dishesName?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text('Отмена'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: Text('ОК'),
                    ),
                  ],
                );
              },
            ) ??
            false;
        if (deleteDishes) {
          dishesSQL.deleteByDishes(dishesName.toLowerCase());
          add(UpdataDishesData());
          // переименовать в Json файле
          event.menuItem.deleteByPath(state.pathMenu);
          // Автоматическое сохранение после переименования
          DirectoryFilesUtils.saveMenuToFile(event.menuItem, event.filePath);
          emit(
            state.copyWith(
              ingredientsList: [],
              dishes: '',
              pathMenu: '',
              price: '',
            ),
          );
          event.func();
        }
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
    /* проверка на пересоздание */
    if (state.dishes.trim().isEmpty) {
      return 'Выберите блюдо !';
    } else if (state.price.isEmpty) {
      return 'Введите цену !';
    } else if (state.ingredientsList.isEmpty) {
      return 'Введите ингредиенты !';
    } else {
      return '';
    }
  }

  String changeDishesEasy() {
    /* проверка на пересоздание */
    if (state.dishes.trim().isEmpty) {
      return 'Выберите блюдо !';
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
