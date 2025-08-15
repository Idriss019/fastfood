import 'package:drift/drift.dart';
import 'package:fastfood/DB/database.dart';

class PurchasesTableDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get date => integer().nullable()();
  TextColumn get barcode => text().withLength(min: 1, max: 20).nullable()();
  TextColumn get product => text()();
  IntColumn get quantity => integer()(); // Количество
  RealColumn get cost => real()();
}

class PurchasesSql {
  final AppDatabase database;
  PurchasesSql({required this.database});
}
