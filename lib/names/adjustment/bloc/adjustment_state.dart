part of 'adjustment_bloc.dart';

sealed class AdjustmentState extends Equatable {
  const AdjustmentState();
  
  @override
  List<Object> get props => [];
}

final class AdjustmentInitial extends AdjustmentState {}
