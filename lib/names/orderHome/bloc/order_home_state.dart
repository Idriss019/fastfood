part of 'order_home_bloc.dart';

sealed class OrderHomeState extends Equatable {
  const OrderHomeState();
  
  @override
  List<Object> get props => [];
}

final class OrderHomeInitial extends OrderHomeState {}
