// ignore_for_file: public_member_api_docs, sort_constructors_first
class PurchasesData {
  final int id;
  final int? date;
  final String? barcode;
  final String product;
  final int? quantity;
  final String? measuring;
  final double? priceOfPurchases;

  PurchasesData({
    required this.id,
    required this.product,
    this.date = 0,
    this.barcode,
    this.quantity = 0,
    this.measuring = '',
    this.priceOfPurchases,
  });

  PurchasesData copyWith({
    int? id,
    int? date,
    String? barcode,
    String? product,
    int? quantity,
    String? measuring,
    double? priceOfPurchases,
  }) {
    return PurchasesData(
      id: id ?? this.id,
      date: date ?? this.date,
      barcode: barcode ?? this.barcode,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      measuring: measuring ?? this.measuring,
      priceOfPurchases: priceOfPurchases ?? this.priceOfPurchases,
    );
  }
}
