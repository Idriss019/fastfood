import 'package:drift/drift.dart';
import 'package:fastfood/DB/database.dart';

class StaffTableDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get login => text().withLength(min: 1, max: 30).nullable()();
  TextColumn get password => text().withLength(min: 1, max: 20).nullable()();
  TextColumn get position => text().withLength(min: 1, max: 20).nullable()(); // Создать столбик данных должности!
}

class StaffSQL {
  final AppDatabase database;
  StaffSQL({required this.database});
}
