part of 'purchases_bloc.dart';

sealed class PurchasesState extends Equatable {
  const PurchasesState();
  
  @override
  List<Object> get props => [];
}

final class PurchasesInitial extends PurchasesState {}
