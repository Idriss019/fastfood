import 'package:drift/drift.dart';
import 'package:fastfood/DB/database.dart';
import 'package:fastfood/data_class/purchases_data.dart';

class PurchasesTableDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get date => integer().nullable()();
  TextColumn get barcode => text().withLength(min: 1, max: 20).nullable()();
  TextColumn get product => text()();
  IntColumn get quantity => integer()(); // Количество
  TextColumn get measuring => text().withLength(min: 1, max: 5)(); // Изм
  RealColumn get priceOfPurchases => real()(); // Одного
}

class PurchasesSql {
  final AppDatabase database;
  PurchasesSql({required this.database});

  /// Добавить все элементы из списка
  Future<void> insertAllList(List<PurchasesData> purchases) async {
    final companions = purchases.map((data) {
      if (data.barcode != null && data.barcode != '') {
        return PurchasesTableDBCompanion(
          date: Value(data.date),
          barcode: Value(data.barcode),
          product: Value(data.product.toLowerCase()),
          quantity: Value(data.quantity ?? 1),
          measuring: Value(data.measuring ?? 'шт'),
          priceOfPurchases: Value(data.priceOfPurchases ?? 0),
        );
      } else {
        return PurchasesTableDBCompanion(
          date: Value(data.date),
          product: Value(data.product.toLowerCase()),
          quantity: Value(data.quantity ?? 1),
          measuring: Value(data.measuring ?? 'шт'),
          priceOfPurchases: Value(data.priceOfPurchases ?? 0),
        );
      }
    }).toList();

    await database.batch((batch) {
      batch.insertAll(database.purchasesTableDB, companions);
    });
  }
}
