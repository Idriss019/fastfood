class DishesData {
  final String nameDishes;
  final String? product;
  final int? quantity;
  final String? measuring;
  final double? costPriceProduct;
  final double? priceDishes;

  DishesData({
    required this.nameDishes,
    this.product,
    this.quantity,
    this.measuring,
    this.costPriceProduct,
    this.priceDishes,
  });

  DishesData copyWith({
    String? nameDishes,
    String? product,
    String? barcode,
    int? quantity,
    String? measuring,
    double? costPriceProduct,
    double? priceDishes,
  }) {
    return DishesData(
      nameDishes: nameDishes ?? this.nameDishes,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      measuring: measuring ?? this.measuring,
      costPriceProduct: costPriceProduct ?? this.costPriceProduct,
      priceDishes: priceDishes ?? this.priceDishes,
    );
  }
}
