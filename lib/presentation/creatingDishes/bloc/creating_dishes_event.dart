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
  const IngredientInput(this.ingredient);

  @override
  List<Object> get props => [ingredient];
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
  final String path;
  const DishesInput(this.dishes, this.path);

  @override
  List<Object> get props => [dishes, path];
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

class UpdateTotal extends CreatingDishesEvent {}

class UpdataStorageData extends CreatingDishesEvent {}

class PressMenuItem extends CreatingDishesEvent {}

class UpdataDishesData extends CreatingDishesEvent {}

/* Dishes Table */
class UpdateIngredientList extends CreatingDishesEvent {
  final DishesData newData;
  final int index;
  const UpdateIngredientList({required this.index, required this.newData});
  @override
  List<Object> get props => [index, newData];
}

class RemoveFromList extends CreatingDishesEvent {
  final DishesData data;
  const RemoveFromList({required this.data});
  @override
  List<Object> get props => [data];
}

/* Bottom button */
class ButtonCreateDishes extends CreatingDishesEvent {
  final BuildContext context;
  const ButtonCreateDishes(this.context);
  @override
  List<Object> get props => [context];
}

class RenameDishes extends CreatingDishesEvent {
  // final String oldDishes;
  final MenuItem menuItem;
  final BuildContext context;
  final String filePath;
  final Function func;
  const RenameDishes(
    // this.oldDishes,
    this.menuItem,
    this.filePath,
    this.context,
    this.func,
  );

  @override
  List<Object> get props => [
    // oldDishes,
    filePath,
    menuItem,
    context,
    func,
  ];
}

class DeleteDishes extends CreatingDishesEvent {
  // final String oldDishes;
  final MenuItem menuItem;
  final BuildContext context;
  final String filePath;
  final Function func;
  const DeleteDishes(
    // this.oldDishes,
    this.menuItem,
    this.filePath,
    this.context,
    this.func,
  );

  @override
  List<Object> get props => [
    // oldDishes,
    filePath,
    menuItem,
    context,
    func,
  ];
}
