class OrderData {
  final int? quantity;
  final String product;
  final double? costPrice;
  final double? price;

  OrderData({
    required this.product,
    this.quantity,
    this.costPrice,
    this.price,
  });

  OrderData copyWith({
    int? quantity,
    String? product,
    double? costPrice,
    double? price,
  }) {
    return OrderData(
      quantity: quantity ?? this.quantity,
      product: product ?? this.product,
      costPrice: costPrice ?? this.costPrice,
      price: price ?? this.price,
    );
  }
}
