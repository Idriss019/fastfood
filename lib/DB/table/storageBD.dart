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
  BoolColumn get visibility => boolean().clientDefault(() => true)(); //Вид
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
        visibility: i.visibility,
      );
      storageList.add(storageData);
    }
    return storageList;
  }
}
