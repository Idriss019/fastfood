import 'package:drift/drift.dart';
import 'package:fastfood/DB/database.dart';

class DishesTableDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nameDishes => text().withLength(min: 1, max: 30).nullable()();
  TextColumn get product => text()();
  TextColumn get typeQuantity => text().withLength(min: 1, max: 8).nullable()();
  IntColumn get quantity => integer()(); // Количество
  RealColumn get price => real().nullable()();
}

class DishesSQL {
  final AppDatabase database;
  DishesSQL({required this.database});
}
