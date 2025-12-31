import 'package:dart_helper_method/string_helper.dart';
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
  Future<int> insertRoot() async {
    return await database
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

  // Добавить сотрудника
  Future<int> insertStaff(StaffData staffData) async {
    // if(staffData.powers == null || staffData.powers!.isEmpty) {
    //   staffData.powers = powersData;
    // }
    if (staffData.position.isEmpty) {
      staffData = staffData.copyWith(position: 'сотрудник');
    }
    String powersString = '';
    final powerKeys = powersData.keys.toList();
    for (int i = 0; i < powerKeys.length; i++) {
      powersString += (staffData.powers![powerKeys[i]] == true) ? '1' : '0';
    }
    return await database
        .into(database.staffTableDB)
        .insert(
          StaffTableDBCompanion(
            login: Value(staffData.login),
            password: Value(staffData.password),
            position: Value(staffData.position),
            powers: Value(powersString),
          ),
        );
  }

  // Получить всех сотрудников
  Future<List<StaffData>> getAllStaff() async {
    final queryResult = await database.select(database.staffTableDB).get();
    // print('start');
    // print(queryResult.length);
    List<StaffData> newList = [];
    for (var i in queryResult) {
      newList.add(
        StaffData(
          id: i.id,
          login: i.login!,
          password: i.password!,
          position: i.position!,
          powers: StaffData.transformationPowersToMap(i.powers!),
          ),
      );
      // print('${i.login} : ${StaffData.transformationPowersToMap(i.powers!)}');
      // print('++++++'); Map<String, List<dynamic>>.from(powersData);
      // print(StaffData.transformationPowersToMap(i.powers!));
    }

    //   print(StaffData.transformationPowersToMap(
    //       row.powers!,
    //     ),);
    // newList.forEach((element) => print(element));
    // print('newList  = $newList');
    return newList;
    // return queryResult.map((row) {
    //   // final powersString = row.powers ?? '';
    //   // final powersMap = <String, bool>{};
    //   // final powerKeys = powersData.keys.toList();

    //   // for (int i = 0; i < powerKeys.length; i++) {
    //   //   powersMap[powerKeys[i]] =
    //   //       i < powersString.length && powersString[i] == '1' ? true : false;
    //   // }
    //   print('--------');
    //   print(StaffData.transformationPowersToMap(
    //       row.powers!,
    //     ),);
    //   return StaffData(
    //     id: row.id,
    //     login: row.login!.capitalizeEach(),
    //     password: row.password ?? '',
    //     position: row.position != null ? row.position!.capitalizeEach() : '',
    //     powers: StaffData.transformationPowersToMap(
    //       row.powers!,
    //     ), //powersMap,
    //   );
    // }).toList();
  }

  // Получить всех сотрудников listener
  Stream<List<StaffData>> watchAllStaff() {
    final query = database.select(database.staffTableDB);
    return query.watch().map((rows) {
      return rows.map((row) {
        // print('Проверка получения сотрудника из БД: ${row.powers}');
        // final powersString = row.powers ?? '';
        // final powersMap = <String, bool>{};
        // final powerKeys = powersData.keys.toList();

        // for (int i = 0; i < powerKeys.length; i++) {
        //   powersMap[powerKeys[i]] = powersString[i] == '1' ? true : false;
        // }
        // print(
        //   'Проверка получения полномочий сотрудника!!: ${StaffData.transformationPowersToMap(row.powers ?? '')}',
        // );
        // print('row.powers : ${row.powers}');
        return StaffData(
          id: row.id,
          login: row.login!.capitalizeEach(),
          password: row.password ?? '',
          position: row.position != null ? row.position!.capitalizeEach() : '',
          powers: StaffData.transformationPowersToMap(
            row.powers ?? '',
          ), //powersMap,
        );
      }).toList();
    });
  }

  // // Обновить сотрудника по login
  // Future<bool> updateStaffByLogin(StaffData staffData) async {
  //   // String powersString = '';
  //   // final powerKeys = powersData.keys.toList();
  //   // for (int i = 0; i < powerKeys.length; i++) {
  //   //   powersString += (staffData.powers![powerKeys[i]] == true) ? '1' : '0';
  //   // }
  //   final updateCompanion = StaffTableDBCompanion(
  //     login: Value(staffData.login.saveText()),
  //     password: Value(staffData.password),
  //     position: Value(staffData.position),
  //     powers: Value(StaffData.transformationPowersToString(staffData.powers)),
  //   );
  //   final rowsAffected =
  //       await (database.update(database.staffTableDB)
  //             ..where((tbl) => tbl.login.equals(staffData.login)))
  //           .write(updateCompanion);
  //   return rowsAffected > 0;
  // }

  // Изменить по login
  Future<void> updateStaffByLogin2(StaffData staffData) async {
    await (database.update(
      database.staffTableDB,
    )..where((tbl) => tbl.login.equals(staffData.login.toLowerCase()))).write(
      StaffTableDBCompanion(
        login: Value(staffData.login.toLowerCase()),
        password: Value(staffData.password),
        position: Value(staffData.position.toLowerCase()),
        powers: Value(StaffData.transformationPowersToString(staffData.powers)),
      ),
    );
  }

  // Изменить по login
  Future<void> updateById(StaffData staffData) async {
    await (database.update(
      database.staffTableDB,
    )..where((tbl) => tbl.id.equals(staffData.id))).write(
      StaffTableDBCompanion(
        login: Value(staffData.login.toLowerCase()),
        password: Value(staffData.password),
        position: Value(staffData.position.toLowerCase()),
        powers: Value(StaffData.transformationPowersToString(staffData.powers)),
      ),
    );
  }

  Future<void> deleteById(StaffData staffData) async {
    await (database.delete(
      database.staffTableDB,
    )..where((tbl) => tbl.id.equals(staffData.id))).go();
  }

  // Future<bool> updateStaff(StaffData staffData) async {
  //   String powersString = '';
  //   final powerKeys = powersData.keys.toList();
  //   for (int i = 0; i < powerKeys.length; i++) {
  //     powersString += (staffData.powers![powerKeys[i]] == true) ? '1' : '0';
  //   }
  //   final updateCompanion = StaffTableDBCompanion(
  //     login: Value(staffData.login),
  //     password: Value(staffData.password),
  //     position: Value(staffData.position),
  //     powers: Value(powersString),
  //   );
  //   final rowsAffected = await (database.update(
  //     database.staffTableDB,
  //   )..where((tbl) => tbl.id.equals(staffData.id))).write(updateCompanion);
  //   return rowsAffected > 0;
  // }
}
