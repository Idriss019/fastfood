import 'dart:io';

// import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:fastfood/DB/table/dishesDB.dart';
import 'package:fastfood/DB/table/historyDB.dart';
import 'package:fastfood/DB/table/purchasesDB.dart';
import 'package:fastfood/DB/table/salesDB.dart';
import 'package:fastfood/DB/table/staffDB.dart';
import 'package:fastfood/DB/table/storageBD.dart';

part 'database.g.dart';

@DriftDatabase(tables: [StorageTableDB, SalesTableDB, PurchasesTableDB, DishesTableDB,HistoryTableDB,StaffTableDB])
class AppDatabase extends _$AppDatabase {
  // AppDatabase() : super(_openConnection());
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return NativeDatabase.createInBackground(
        File('database/fastFoodDB.sql'));
  }
  // return NativeDatabase(File('/optVitamin02.sql'));
  // final dbFolder = getApplicationCacheDirectory();
  // final file = File(p.join(dbFolder.p, 'optVitamin01'));
//       print('FILE PATH: === $file');
  // return driftDatabase(name: 'optVitamin01');
  // File('/storage/emulated/0/Documents/$name');
}

