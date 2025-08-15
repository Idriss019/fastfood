import 'package:drift/drift.dart';
import 'package:fastfood/DB/database.dart';

class HistoryTableDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get date => integer().nullable()();
  TextColumn get action => text()();
  TextColumn get login => text().withLength(min: 1, max: 30).nullable()();
  TextColumn get position => text().withLength(min: 1, max: 20).nullable()();
}

class HistorySQL {
  final AppDatabase database;
  HistorySQL({required this.database});
}
