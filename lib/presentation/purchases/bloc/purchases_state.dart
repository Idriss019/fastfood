// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'purchases_bloc.dart';

class PurchasesState extends Equatable {
  final String showTitle;
  final String barcode;
  final String quantity;
  final String measuring;
  final String product;  
  final String purchases;
  final String price;
  final String purchasesSum;
  final String priceSum;
  final String total;
  final List<PurchasesData> purchasesList;
  final List<StorageData> storageListSQL;
  final Map<String, StorageData> storageMapSQL;
  final List<String> filterList;
  const PurchasesState({
    this.showTitle = '',
    this.barcode = '',
    this.quantity = '',
    this.measuring = '',
    this.product = '',
    this.purchases = '',
    this.price = '',
    this.purchasesSum = '',
    this.priceSum = '',
    this.total = '',
    this.purchasesList = const [],
    this.storageListSQL = const [],
    this.storageMapSQL = const {},
    this.filterList = const []
  });
  
  @override
  List<Object> get props => [
    showTitle,
    barcode,
    quantity,
    measuring,
    product,
    purchases,
    price,
    purchasesSum,
    priceSum,
    total,
    purchasesList,
    storageListSQL,
    storageMapSQL,
    filterList,
  ];

  PurchasesState copyWith({
    String? showTitle,
    String? barcode,
    String? quantity,
    String? measuring,
    String? product,
    String? purchases,
    String? price,
    String? purchasesSum,
    String? priceSum,
    String? total,
    List<PurchasesData>? purchasesList,
    List<StorageData>? storageListSQL,
    Map<String, StorageData>? storageMapSQL,
    List<String>? filterList,
  }) {
    return PurchasesState(
      showTitle: showTitle ?? this.showTitle,
      barcode: barcode ?? this.barcode,
      quantity: quantity ?? this.quantity,
      measuring: measuring ?? this.measuring,
      product: product ?? this.product,
      purchases: purchases ?? this.purchases,
      price: price ?? this.price,
      purchasesSum: purchasesSum ?? this.purchasesSum,
      priceSum: priceSum ?? this.priceSum,
      total: total ?? this.total,
      purchasesList: purchasesList ?? this.purchasesList,
      storageListSQL: storageListSQL ?? this.storageListSQL,
      storageMapSQL: storageMapSQL ?? this.storageMapSQL,
      filterList: filterList ?? this.filterList,
    );
  }
}

final class PurchasesInitial extends PurchasesState {}
