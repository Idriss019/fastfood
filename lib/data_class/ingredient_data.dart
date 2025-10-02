class IngredientData {
  final String product;
  final String? barcode;
  final int? quantity;
  final String? measuring;
  final double? costPrice;

  IngredientData({
    required this.product,
    this.barcode,
    this.quantity,
    this.measuring,
    this.costPrice,
  });


  IngredientData copyWith({
    String? product,
    String? barcode,
    int? quantity,
    String? measuring,
    double? costPrice,
  }) {
    return IngredientData(
      product: product ?? this.product,
      barcode: barcode ?? this.barcode,
      quantity: quantity ?? this.quantity,
      measuring: measuring ?? this.measuring,
      costPrice: costPrice ?? this.costPrice,
    );
  }
}
