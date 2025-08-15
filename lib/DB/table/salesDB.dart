import 'package:drift/drift.dart';
import 'package:fastfood/DB/database.dart';

class SalesTableDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get order => integer()();
  IntColumn get date => integer().nullable()();
  RealColumn get sumOrder => real()(); // Сумма корзины в рублях
  TextColumn get barcode => text().withLength(min: 1, max: 20).nullable()();
  TextColumn get product => text()();
  IntColumn get quantity => integer()(); // Количество
  RealColumn get price => real()();
  RealColumn get nds => real()(); // NDS
  BoolColumn get sold => boolean().clientDefault(() => false)(); // продано
  BoolColumn get paid => boolean().clientDefault(() => false)(); // оплачено
}

class SalesSql {
  final AppDatabase database;
  SalesSql({required this.database});
}
