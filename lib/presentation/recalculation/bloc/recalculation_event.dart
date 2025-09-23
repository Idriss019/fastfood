part of 'recalculation_bloc.dart';

abstract class RecalculationEvent extends Equatable {
  const RecalculationEvent();

  @override
  List<Object> get props => [];
}

class GetLists extends RecalculationEvent {}

class SearchByInput extends RecalculationEvent {
  final String title;
  const SearchByInput(this.title);
  @override
  List<Object> get props => [title];
}

class QuantityInput extends RecalculationEvent {
  final String quantity;
  const QuantityInput(this.quantity);

  @override
  List<Object> get props => [quantity];
}

class PressDropList extends RecalculationEvent {
  final String foundItem;
  final List<StorageData> sData;
  const PressDropList({
    required this.foundItem,
    required this.sData,
  });
  @override
  List<Object> get props => [foundItem, sData];
}

class LoadFromSQL extends RecalculationEvent {}

class UpdateTableRecalculation extends RecalculationEvent {
  final List<StorageData> newList;
  const UpdateTableRecalculation({
    required this.newList,
  });
  @override
  List<Object> get props => [newList];
}

class CancelButtonEvent extends RecalculationEvent {}

class ResetFound extends RecalculationEvent {
  final String product;
  final String barcode;
  const ResetFound(this.product, this.barcode);

  @override
  List<Object> get props => [product, barcode];
}

class UpdateFound extends RecalculationEvent {
  final StorageData sData;
  final BuildContext context;
  const UpdateFound(
    this.sData, this.context
  );

  @override
  List<Object> get props => [sData, context];
}

class ChangeMessage extends RecalculationEvent {}

class ResetAllCounts extends RecalculationEvent {
final BuildContext context;
  const ResetAllCounts(
    this.context
  );

  @override
  List<Object> get props => [context];
}
class SortByBarcode extends RecalculationEvent {}
class SortByProduct extends RecalculationEvent {}
class SortRemainder extends RecalculationEvent {}
class SortFound extends RecalculationEvent {}
  // final BuildContext context;
//   final List<StorageData> list; Reset all counts
//   const SearchByInput(
//     // this.context, 
//     this.list);
//   @override
//   List<Object> get props => [
//     // context, 
//     list];
// }