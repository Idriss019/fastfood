// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// List<PurchasesData> purchasesList = [];
List<StorageData> storageList = [];


// List<SalesData> salesListWithoutBasket = [];

class StorageData {
  final int? id;
  final String? barcode;
  final String product;
  final int? quantity;
  final double? priceOfSom;
  final int? found;
   const StorageData({
    required this.product,
    this.id,
    this.quantity = 0,
    this.barcode,
    this.priceOfSom,
    this.found = 0,
  });


  StorageData copyWith({
    int? id,
    String? barcode,
    String? product,
    int? quantity,
    double? priceOfSom,
    int? found,
  }) {
    return StorageData(
      product: product ?? this.product,
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      barcode: barcode ?? this.barcode,
      priceOfSom: priceOfSom ?? this.priceOfSom,
      found: found ?? this.found,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'barcode': barcode,
      'product': product,
      'quantity': quantity,
      'priceOfSom': priceOfSom,
      'found': found,
    };
  }

  // factory StorageData.fromMap(Map<String, dynamic> map) {
  //   return StorageData(
  //     map['id'] != null ? map['id'] as int : null,
  //     map['barcode'] != null ? map['barcode'] as String : null,
  //     map['product'] as String,
  //     map['quantity'] != null ? map['quantity'] as int : null,
  //     map['priceOfSom'] != null ? map['priceOfSom'] as double : null,
  //     map['found'] != null ? map['found'] as int : null,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory StorageData.fromJson(String source) => StorageData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StorageData(id: $id, barcode: $barcode, product: $product, quantity: $quantity, priceOfSom: $priceOfSom, found: $found)';
  }

  @override
  bool operator ==(covariant StorageData other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.barcode == barcode &&
      other.product == product &&
      other.quantity == quantity &&
      other.priceOfSom == priceOfSom &&
      other.found == found;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      barcode.hashCode ^
      product.hashCode ^
      quantity.hashCode ^
      priceOfSom.hashCode ^
      found.hashCode;
  }
}
