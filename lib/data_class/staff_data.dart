// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class StaffData extends Equatable {
  final int id;
  final String login;
  final String password;
  final String position;
  final Map<String, List<dynamic>>? powers;

  @override
  List<Object?> get props => [
    id,
    login,
    password,
    position,
    powers,
  ];

  static Map<String, List<dynamic>> transformationPowersToMap(String numberPowers) {
    Map<String, List<dynamic>> transformedPowers = {};
    if (numberPowers.isEmpty) {
      return defaultPowers();
      // print('Преобразование полномочий PowersToMap : пустая строка');
    }
    final powerKeys = powersData.keys.toList();

    for (int i = 0; i < powerKeys.length; i++) {
      // Преобразуем число в булево значение и обновляем список для каждого ключа
      bool powerEnabled = numberPowers[i][0] == '1' ? true : false;
      transformedPowers[powerKeys[i]] = [powerEnabled];
      // transformedPowers[powerKeys[i][0]] = numberPowers[i] == '1' ? true : false;
    }
    // print('Преобразование полномочий PowersToMap : $transformedPowers');
    return transformedPowers;
  }

  static String transformationPowersToString(Map<String, List<dynamic>>? powersMap) {
    String powersString = '';
    if (powersMap == null || powersMap.isEmpty) {
      powersMap = defaultPowers();
      // print('Преобразование полномочий PowersToString : пустая карта');
    }
    final powerKeys = powersData.keys.toList();

    for (int i = 0; i < powerKeys.length; i++) {
      // Получаем список для текущего ключа и проверяем, является ли первый элемент булевым значением
      bool powerEnabled = powersMap[powerKeys[i]]?[0] ?? false;  // Если значение не найдено, по умолчанию false
      powersString += powerEnabled ? '1' : '0';  // Добавляем '1' если активировано, '0' если нет
  
      // powersString += powersMap[powerKeys[i][0]]  as bool == true ? '1' : '0';
    }
    // print('PowersToString : $powersMap');
    // print('Преобразование полномочий PowersToString : $powersString');
    return powersString;
  }

  StaffData({
    this.id = 0,
    required this.login,
    required this.password,
    required this.position,
    Map<String, List<dynamic>>? powers,
  })  : powers = powers ?? defaultPowers();

  StaffData copyWith({
  int? id,
  String? login,
  String? password,
  String? position,
  Map<String, List<dynamic>>? powers,
}) {
  return StaffData(
    id: id ?? this.id,
    login: login ?? this.login,
    password: password ?? this.password,
    position: position ?? this.position,
    powers: powers != null
        ? Map<String, List<dynamic>>.from(powers)
        : Map<String, List<dynamic>>.from(this.powers ?? {}),
  );
}
}

// Map<String, bool> powersData = {
//   'страница заказы': false, // 0
//   'страница оплата': false, // 1
//   'совершать возврат': false, // 2
//   'страница склад': false, // 3
//   'страница закупки': false, // 4
//   'страница персонал': false, // 5
//   'страница таблицы': false, // 6
//   'страница создание_блюда': false, // 7
//   'страница отчет': false, // 8
//   'страница настройки': false, // 9
// };

Map<String, List<dynamic>> powersData = {
  'страница заказы': [false, 'заказы', 'возможность совершать заказы'], // 0
  'страница оплата': [false, 'оплата', 'возможность совершать оплату'], // 1
  'совершать возврат': [false, 'возврат', 'возможность совершать возврат'], // 2
  'страница склад': [false, 'склад', 'работать со складом'], // 3
  'страница закупки': [false, 'закупки', 'возможность совершать закупки'], // 4
  'страница персонал': [false, 'персонал', 'возможность добавлять сотрудника и манипулировать с доступом '], // 5
  'страница таблицы': [false, 'таблицы', 'просматривать таблицы'], // 6
  'страница создание блюда': [false, 'создание блюда', 'возможность создать блюдо и изменить его'], // 7
  'страница отчет': [false, 'отчет', 'возможность просматривать отчет'], // 8
  'страница настройки': [false, 'настройки', 'изменять настройки'], // 9
};


Map<String, List<dynamic>> defaultPowers() =>
    Map<String, List<dynamic>>.from(powersData);