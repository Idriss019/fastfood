part of 'creating_dishes_bloc.dart';

class CreatingDishesEvent extends Equatable {
  const CreatingDishesEvent();

  @override
  List<Object> get props => [];
}

class UpdataState extends CreatingDishesEvent {
  final CreatingDishesState pState;
  const UpdataState({required this.pState});
  @override
  List<Object> get props => [pState];
}

/* ingredient Line */
class IngredientInput extends CreatingDishesEvent {
  final String ingredient;
  const IngredientInput(
    this.ingredient,
  );

  @override
  List<Object> get props => [
    ingredient,
  ];
}
class PressDropIngredient extends CreatingDishesEvent {
  final String filterIngredient;
  const PressDropIngredient(this.filterIngredient);

  @override
  List<Object> get props => [filterIngredient];
}

/* Dishes Line */
class DishesInput extends CreatingDishesEvent {
  final String dishes;
  const DishesInput(
    this.dishes,
  );

  @override
  List<Object> get props => [
    dishes,
  ];
}
class PressDropDishes extends CreatingDishesEvent {
  final String filterDishes;
  const PressDropDishes(this.filterDishes);

  @override
  List<Object> get props => [filterDishes];
}

// class ButtonInputIngredient extends CreatingDishesEvent {}
class ButtonInputIngredient extends CreatingDishesEvent {
  final BuildContext context;
  const ButtonInputIngredient(this.context);
  @override
  List<Object> get props => [context];
}

class ButtonCreateDishes extends CreatingDishesEvent {
  final BuildContext context;
  const ButtonCreateDishes(this.context);
  @override
  List<Object> get props => [context];
}

class UpdateTotal extends CreatingDishesEvent {}
class UpdataStorageData extends CreatingDishesEvent {}

/* Dishes Table */
class UpdateIngredientList extends CreatingDishesEvent {
  final IngredientData newData;
  final int index;
  const UpdateIngredientList({required this.index, required this.newData});
  @override
  List<Object> get props => [index, newData];
}

class RemoveFromList extends CreatingDishesEvent {
  final IngredientData data;
  const RemoveFromList({required this.data});
  @override
  List<Object> get props => [data];
}