import 'package:drift/drift.dart';
import 'package:fastfood/DB/database.dart';

class StorageTableDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get inDishes => boolean().clientDefault(() => false)();
  TextColumn get barcode => text().withLength(min: 1, max: 20).nullable()();
  TextColumn get product => text()();
  IntColumn get quantity => integer()(); // Количество Добавить способ измерения! TextColumn get measuring => text().withLength(min: 1, max: 5)();  2 Добавить видимость IntColumn BoolColumn get visibility => boolean().clientDefault(() => true)();
  RealColumn get price => real().nullable()();
  IntColumn get found =>
      integer().nullable().clientDefault(() => 0)(); // перерасчет
}

class StorageSQL {
  final AppDatabase database;
  StorageSQL({required this.database});
}
