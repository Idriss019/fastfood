import 'package:drift/drift.dart';
import 'package:fastfood/DB/database.dart';
import 'package:fastfood/data_class/staff_data.dart';

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
            login: Value('ROOT'),
            password: Value('12'),
            position: Value('Администратор'),
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
      final powerKeys = [
        'страница_заказы',
        'страница_оплата',
        'совершать_возврат',
        'страница_склад',
        'страница_закупки',
        'страница_персонал',
        'страница_таблицы',
        'страница_создание_блюда',
        'страница_отчет',
        'страница_настройки',
      ];
      for (int i = 0; i < powerKeys.length; i++) {
        powersMap[powerKeys[i]] = i < powersString.length && powersString[i] == '1' ? true : false;
      }
      return StaffData(
        id: row.id,
        login: row.login ?? '',
        password: row.password ?? '',
        position: row.position ?? '',
        powers: powersMap,
      );
    }).toList();
  }
}
