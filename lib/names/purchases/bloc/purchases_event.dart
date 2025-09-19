part of 'purchases_bloc.dart';

abstract class PurchasesEvent extends Equatable {
  const PurchasesEvent();

  @override
  List<Object> get props => [];
}

/* Barcode Line */
class BarcodeInput extends PurchasesEvent {
  final String barcode;
  const BarcodeInput(this.barcode);

  @override
  List<Object> get props => [barcode];
}

// class QuantityInput extends PurchasesEvent {
//   final String quantity;
//   const QuantityInput(String quantity);

//   @override
//   List<Object> get props => [quantity];
// }
class QuantityInput extends PurchasesEvent {
  final String quantity;
  const QuantityInput(this.quantity);

  @override
  List<Object> get props => [quantity];
}

class MeasuringInput extends PurchasesEvent {
  final String measuring;
  const MeasuringInput(this.measuring);

  @override
  List<Object> get props => [measuring];
}

/* Product Line */
class ProductInput extends PurchasesEvent {
  final String product;
  // final List<StorageData> list;
  const ProductInput(
    this.product,
    // this.list
  );

  @override
  List<Object> get props => [
    product,
    // list
  ];
}

/* Purchases Line */
class PurchasesInput extends PurchasesEvent {
  final String purchases;
  const PurchasesInput(this.purchases);

  @override
  List<Object> get props => [purchases];
}

class PriceInput extends PurchasesEvent {
  final String price;
  const PriceInput(this.price);

  @override
  List<Object> get props => [price];
}

/* PurchasesSum Line */
class PurchasesSumInput extends PurchasesEvent {
  final String purchasesSum;
  const PurchasesSumInput(this.purchasesSum);

  @override
  List<Object> get props => [purchasesSum];
}

class PriceSumInput extends PurchasesEvent {
  final String priceSum;
  const PriceSumInput(this.priceSum);

  @override
  List<Object> get props => [priceSum];
}

/* ButtonInput Line */
class ButtonInput extends PurchasesEvent {
  final BuildContext context;
  const ButtonInput(this.context);
  @override
  List<Object> get props => [context];
}

/* BottomButtonInput Line */
class RemoveFromList extends PurchasesEvent {
  final PurchasesData data;
  const RemoveFromList({required this.data});
  @override
  List<Object> get props => [data];
}

class RemoveList extends PurchasesEvent {}

class InputList extends PurchasesEvent {}

class UpdateTotal extends PurchasesEvent {}

class UpdataStorageData extends PurchasesEvent {}

class PressDropList extends PurchasesEvent {
  final String filter;
  const PressDropList(this.filter);

  @override
  List<Object> get props => [filter];
}
// /* ButtonInput Line */
// class TotalInput extends PurchasesEvent {
//   final String total;
//   const TotalInput(this.total);

//   @override
//   List<Object> get props => [total];
// }

class UpdataState extends PurchasesEvent {
  final PurchasesState pState;
  const UpdataState({required this.pState});
  @override
  List<Object> get props => [pState];
}

class UpdatePurchasesList extends PurchasesEvent {
  final PurchasesData newData;
  final int index;
  const UpdatePurchasesList({required this.index, required this.newData});
  @override
  List<Object> get props => [index, newData];
}
