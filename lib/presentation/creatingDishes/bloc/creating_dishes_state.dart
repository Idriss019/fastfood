// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'creating_dishes_bloc.dart';

class CreatingDishesState extends Equatable {
  final String dishes;
  final String pathMenu;
  final String ingredientTitle;
  final String quantity;
  final String measuring;
  final String costPrice;
  final String price;
  // final List<DishesData>ingredients;
  final List<DishesData> ingredientsList;
  final List<DishesData> dishesListSQL;
  final List<StorageData> storageListSQL;
  final Map<String, StorageData> storageMapSQL;
  final List<String> filterIngredient;
  final List<String> filterDishes;

  const CreatingDishesState({
    this.dishes = '',
    this.pathMenu = '',
    this.quantity = '',
    this.measuring = '',
    this.costPrice = '',
    this.price = '',
    this.ingredientTitle = '',
    // this.ingredients = const [],
    this.ingredientsList = const [],
    this.dishesListSQL = const [],
    this.storageListSQL = const [],
    this.storageMapSQL = const {},
    this.filterIngredient = const [],
    this.filterDishes = const [],
  });

  @override
  List<Object> get props => [
    dishes,
    pathMenu,
    quantity,
    measuring,
    costPrice,
    price,
    ingredientTitle,
    // ingredients,
    ingredientsList,
    dishesListSQL,
    storageListSQL,
    storageMapSQL,
    filterIngredient,
    filterDishes,
  ];



  CreatingDishesState copyWith({
    String? dishes,
    String? pathMenu,
    String? ingredientTitle,
    String? quantity,
    String? measuring,
    String? costPrice,
    String? price,
    List<DishesData>? ingredientsList,
    List<DishesData>? dishesListSQL,
    List<StorageData>? storageListSQL,
    Map<String, StorageData>? storageMapSQL,
    List<String>? filterIngredient,
    List<String>? filterDishes,
  }) {
    return CreatingDishesState(
      dishes: dishes ?? this.dishes,
      pathMenu: pathMenu ?? this.pathMenu,
      ingredientTitle: ingredientTitle ?? this.ingredientTitle,
      quantity: quantity ?? this.quantity,
      measuring: measuring ?? this.measuring,
      costPrice: costPrice ?? this.costPrice,
      price: price ?? this.price,
      ingredientsList: ingredientsList ?? this.ingredientsList,
      dishesListSQL: dishesListSQL ?? this.dishesListSQL,
      storageListSQL: storageListSQL ?? this.storageListSQL,
      storageMapSQL: storageMapSQL ?? this.storageMapSQL,
      filterIngredient: filterIngredient ?? this.filterIngredient,
      filterDishes: filterDishes ?? this.filterDishes,
    );
  }
}

final class CreatingDishesInitial extends CreatingDishesState {}
