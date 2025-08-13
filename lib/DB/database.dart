// import 'dart:io';
// import 'package:path/path.dart' as p;
// import 'package:drift/drift.dart';
// import 'package:drift/native.dart';
// import 'package:drift_flutter/drift_flutter.dart';
// import 'package:vitamin_opt_5/data/db/tables/purchasesTable.dart';
// import 'package:vitamin_opt_5/data/db/tables/salesTable.dart';
// import 'package:vitamin_opt_5/data/db/tables/storageTable.dart';

// part 'database.g.dart';

// @DriftDatabase(tables: [])
// class AppDatabase extends _$AppDatabase {
//   // AppDatabase() : super(_openConnection());
//   AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

//   @override
//   int get schemaVersion => 1;

//   static QueryExecutor _openConnection() {
//     return NativeDatabase.createInBackground(
//         File('database/fastFoodDB.sql'));
//   }
//   // return NativeDatabase(File('/optVitamin02.sql'));
//   // final dbFolder = getApplicationCacheDirectory();
//   // final file = File(p.join(dbFolder.p, 'optVitamin01'));
// //       print('FILE PATH: === $file');
//   // return driftDatabase(name: 'optVitamin01');
//   // File('/storage/emulated/0/Documents/$name');
// }

  // static LazyDatabase _openConnection() {
  //   return LazyDatabase(() async {
  //     final dbFolder = await getApplicationCacheDirectory();
  //     final file = File(p.join(dbFolder.path, 'optVitamin01'));
  //     print('FILE PATH: === $file');
  //     // return NativeDatabase(file);
  //     // await file.delete();
  //     // return driftDatabase(name: 'optVitamin01');
  //     // return NativeDatabase.createInBackground(file);
  //   });
  // }
// }
// }
