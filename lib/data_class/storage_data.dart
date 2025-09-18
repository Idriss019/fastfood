class StorageData {
  final int id;
  final bool inDishes;
  final String? barcode;
  final String product;
  final int quantity;
  final String measuring;
  final bool visibility;
  final double? price;
  final int? found;

  StorageData({
    required this.id,
    this.inDishes = false,
    this.barcode,
    required this.product,
    required this.quantity,
    required this.measuring,
    this.visibility = true,
    this.price,
    this.found = 0,
  });

  // Пример метода копирования с изменениями (если нужно)
  StorageData copyWith({
    int? id,
    bool? inDishes,
    String? barcode,
    String? product,
    int? quantity,
    String? measuring,
    bool? visibility,
    double? price,
    int? found,
  }) {
    return StorageData(
      id: id ?? this.id,
      inDishes: inDishes ?? this.inDishes,
      barcode: barcode ?? this.barcode,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      measuring: measuring ?? this.measuring,
      visibility: visibility ?? this.visibility,
      price: price ?? this.price,
      found: found ?? this.found,
    );
  }
}
