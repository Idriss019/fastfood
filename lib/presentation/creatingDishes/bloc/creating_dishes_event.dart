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
class UpdataStorageData extends CreatingDishesEvent {}