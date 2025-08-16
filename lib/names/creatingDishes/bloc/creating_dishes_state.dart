part of 'creating_dishes_bloc.dart';

sealed class CreatingDishesState extends Equatable {
  const CreatingDishesState();
  
  @override
  List<Object> get props => [];
}

final class CreatingDishesInitial extends CreatingDishesState {}
