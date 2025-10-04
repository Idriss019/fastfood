import 'package:drift/drift.dart';
import 'package:fastfood/DB/database.dart';
import 'package:fastfood/data_class/dishes_data.dart';

class DishesTableDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nameDishes => text().withLength(min: 1, max: 30).nullable()();
  TextColumn get product => text()();
  TextColumn get measuring => text().withLength(min: 1, max: 8).nullable()(); // measuring
  IntColumn get quantity => integer()(); // Количество
  RealColumn get costPriceProduct => real().nullable()();
  // RealColumn get price => real().nullable()();
  RealColumn get priceDishes => real().nullable()();
}

class DishesSQL {
  final AppDatabase database;
  DishesSQL({required this.database});

  /// Добавить все элементы из списка
  Future<void> insertAllList(List<DishesData> dishesList) async {
    final companions = dishesList.map((data) {
        return DishesTableDBCompanion(
          nameDishes: Value(data.nameDishes.toLowerCase()),
          product: Value(data.product!.toLowerCase()),
          quantity: Value(data.quantity ?? 1),
          measuring: Value(data.measuring ?? 'шт'),
          costPriceProduct: Value(data.costPriceProduct ?? 0),
          priceDishes: Value(data.priceDishes ?? 0),
        );
    }).toList();

    await database.batch((batch) {
      batch.insertAll(database.dishesTableDB, companions);
    });
  }

  /// Получить  все элементы
  Future<List<DishesData>> getAll() async {
    final List result = await database.select(database.dishesTableDB).get();
    List<DishesData> dishesList = [];
    for (var i in result) {
      DishesData dishesData = DishesData(
        nameDishes: i.nameDishes,
        product: i.product,
        quantity: i.quantity,
        measuring: i.measuring,
        costPriceProduct: i.costPriceProduct,
        priceDishes: i.priceDishes,
      );
      dishesList.add(dishesData);
    }
    return dishesList;
  }
}

