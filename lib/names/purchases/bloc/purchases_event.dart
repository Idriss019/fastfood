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