import 'package:drift/drift.dart';
import 'package:fastfood/DB/database.dart';
import 'package:fastfood/data_class/staff_data.dart';
import 'package:string_capitalize/string_capitalize.dart';

class StaffTableDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get login => text().withLength(min: 1, max: 30).nullable()();
  TextColumn get password => text().withLength(min: 1, max: 20).nullable()();
  TextColumn get position => text().withLength(min: 1, max: 20).nullable()();
  TextColumn get powers =>
      text().withLength(min: 1, max: 40).nullable()(); // полномочия
  // Создать столбик данных должности!
}

class StaffSQL {
  final AppDatabase database;
  StaffSQL({required this.database});

  // Добавить рут (админа)
  Future<int> insertRoot() {
    return database
        .into(database.staffTableDB)
        .insert(
          StaffTableDBCompanion(
            login: Value('aня'),
            password: Value('2222'),
            position: Value('администратор'),
            powers: Value('1111111111111111111111111111111111111111'),
          ),
        );
  }


  // Получить всех сотрудника
  Future<List<StaffData>> getAllStaff() async {
    final queryResult = await database.select(database.staffTableDB).get();
    return queryResult.map((row) {
      final powersString = row.powers ?? '';
      final powersMap = <String, bool>{};
      final powerKeys = powersData.keys.toList();

      for (int i = 0; i < powerKeys.length; i++) {
        powersMap[powerKeys[i]] =
            i < powersString.length && powersString[i] == '1' ? true : false;
      }
      return StaffData(
        id: row.id,
        login: row.login!.capitalizeEach(),
        password: row.password ?? '',
        position: row.position != null ? row.position!.capitalizeEach() : '',
        powers: powersMap,
      );
    }).toList();
  }
}
