class DishesData {
  final String nameDishes;
  final String? product;
  final String? barcode;
  final int? quantity;
  final String? measuring;
  final double? costPrice;
  final double? price;

  DishesData({
    required this.nameDishes,
    this.product,
    this.barcode,
    this.quantity,
    this.measuring,
    this.costPrice,
    this.price,
  });

  DishesData copyWith({
    String? nameDishes,
    String? product,
    String? barcode,
    int? quantity,
    String? measuring,
    double? costPrice,
    double? price,
  }) {
    return DishesData(
      nameDishes: nameDishes ?? this.nameDishes,
      product: product ?? this.product,
      barcode: barcode ?? this.barcode,
      quantity: quantity ?? this.quantity,
      measuring: measuring ?? this.measuring,
      costPrice: costPrice ?? this.costPrice,
      price: price ?? this.price,
    );
  }
}
