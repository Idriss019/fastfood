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
  final List<DishesData>ingredients;
  final List<DishesData> ingredientsSQL;
  final Map<String, DishesData> ingredientsMapSQL;
  final List<StorageData> storageListSQL;
  final Map<String, StorageData> storageMapSQL;
  const CreatingDishesState({
    this.dishes = '',
    this.pathMenu = '',
    this.quantity = '',
    this.measuring = '',
    this.costPrice = '',
    this.price = '',
    this.ingredientTitle = '',
    this.ingredients = const [],
    this.ingredientsSQL = const [],
    this.ingredientsMapSQL = const {},
    this.storageListSQL = const [],
    this.storageMapSQL = const {},
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
    ingredients,
    ingredientsSQL,
    ingredientsMapSQL,
    storageListSQL,
    storageMapSQL,
  ];

  CreatingDishesState copyWith({
    String? dishes,
    String? pathMenu,
    String? ingredientTitle,
    String? quantity,
    String? measuring,
    String? costPrice,
    String? price,
    List<DishesData>? ingredientsSQL,
    Map<String, DishesData>? ingredientsMapSQL,
    List<StorageData>? storageListSQL,
    Map<String, StorageData>? storageMapSQL,
  }) {
    return CreatingDishesState(
      dishes: dishes ?? this.dishes,
      pathMenu: pathMenu ?? this.pathMenu,
      ingredientTitle: ingredientTitle ?? this.ingredientTitle,
      quantity: quantity ?? this.quantity,
      measuring: measuring ?? this.measuring,
      costPrice: costPrice ?? this.costPrice,
      price: price ?? this.price,
      ingredientsSQL: ingredientsSQL ?? this.ingredientsSQL,
      ingredientsMapSQL: ingredientsMapSQL ?? this.ingredientsMapSQL,
      storageListSQL: storageListSQL ?? this.storageListSQL,
      storageMapSQL: storageMapSQL ?? this.storageMapSQL,
    );
  }
}

final class CreatingDishesInitial extends CreatingDishesState {}
