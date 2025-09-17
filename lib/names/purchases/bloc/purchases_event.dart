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
  const ProductInput(this.product, 
  // this.list
  );

  @override
  List<Object> get props => [product, 
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
class ButtonInput extends PurchasesEvent {}