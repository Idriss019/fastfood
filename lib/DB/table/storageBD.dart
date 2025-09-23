import 'package:drift/drift.dart';
import 'package:fastfood/DB/database.dart';
import 'package:fastfood/data_class/storage_data.dart';

class StorageTableDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get inDishes => boolean().clientDefault(() => false)();
  TextColumn get barcode => text().withLength(min: 1, max: 20).nullable()();
  TextColumn get product => text()();
  IntColumn get quantity => integer()(); 
  TextColumn get measuring => text().withLength(min: 1, max: 5)();  // Изм
  // BoolColumn get visibility => boolean().clientDefault(() => true)(); //Вид
  RealColumn get price => real().nullable()();
  IntColumn get found =>
      integer().nullable().clientDefault(() => 0)(); // перерасчет
}

class StorageSQL {
  final AppDatabase database;
  StorageSQL({required this.database});

  /// показать все
  Future<List<StorageData>> selectAll() async {
    final List result = await database.select(database.storageTableDB).get();
    List<StorageData> storageList = [];
    for (var i in result) {
      StorageData storageData = StorageData(
        id: i.id,
        inDishes: i.inDishes,
        barcode: i.barcode,
        product: i.product,
        quantity: i.quantity,
        price: i.price,
        found: i.found, 
        measuring: '',
        // visibility: i.visibility,
      );
      storageList.add(storageData);
    }
    return storageList;
  }
  
  /// Добавить все элементы из списка
  Future<void> insertAllList(List<StorageData> storage) async {
    final companions = storage.map((data) {
      if (data.barcode != null && data.barcode != '') {
        return StorageTableDBCompanion(
          inDishes: Value(data.inDishes),
          barcode: Value(data.barcode),
          product: Value(data.product),
          quantity: Value(data.quantity ?? 1),
          measuring: Value(data.measuring  == '' ? 'шт': data.measuring),
          // visibility: Value(data.visibility),
          price: Value(data.price ?? 0),
          found: Value(data.found ?? 0)
        );
      } else {
        return StorageTableDBCompanion(
          inDishes: Value(data.inDishes),
          product: Value(data.product),
          quantity: Value(data.quantity ?? 1),
          measuring: Value(data.measuring  == '' ? 'шт': data.measuring),
          // visibility: Value(data.visibility),
          price: Value(data.price ?? 0),
          found: Value(data.found ?? 0)
        );
      }
    }).toList();

    await database.batch((batch) {
      batch.insertAll(database.storageTableDB, companions);
    });
  }
  
  /// Обновить по названию продукта из списка
  Future<void> updateByProductClass(List<StorageData> list) async {
  await database.transaction(() async {
    for (StorageData item in list) {
      final companion = StorageTableDBCompanion(
        barcode: (item.barcode != null && item.barcode != '') ? Value(item.barcode) : const Value.absent(),
        quantity: item.quantity != null ? Value(item.quantity!) : const Value.absent(),
        price: item.price != null ? Value(item.price) : const Value.absent(),
        found: item.found != null ? Value(item.found) : const Value.absent(),
      );

      await (database.update(database.storageTableDB)
            ..where((tbl) => tbl.product.equals(item.product)))
          .write(companion);
    }
  });
}

  /// Обновить по названию продукта
  // Future<void> updateByProduct({
  //   required String product,
  //   String? barcode,
  //   int? quantity,
  //   double? priceOfSom,
  //   int? found,
  // }) async {
  //   // Создаем пустой компаньон
  //   final companion = StorageTableDBCompanion();

  //   // Заполняем только переданные параметры
  //   if (barcode != null) {
  //     companion.barcode = Value(barcode);
  //   }
  //   if (quantity != null) {
  //     companion.quantity = Value(quantity);
  //   }
  //   if (priceOfSom != null) {
  //     companion.priceOfSom = Value(priceOfSom);
  //   }
  //   if (found != null) {
  //     companion.found = Value(found);
  //   }

  //   // Выполняем обновление по названию продукта
  //   // await (database.update(database.storageTable)
  //   //       ..where((tbl) => tbl.product.equals(product)))
  //   //     .write(companion);
  //   await database.transaction(() async {
  //     await (database.update(database.storageTable)
  //           ..where((tbl) => tbl.product.equals(product)))
  //         .write(companion);
  //   });
  // }
}
