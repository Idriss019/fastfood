// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class StaffData extends Equatable {
  final int id;
  final String login;
  final String password;
  final String position;
  final Map<String, bool>? powers;

  @override
  List<Object?> get props => [
    id,
    login,
    password,
    position,
    powers,
  ];

  static Map<String, bool> transformationPowersToMap(String numberPowers) {
    Map<String, bool> transformedPowers = {};
    if (numberPowers.isEmpty) {
      transformedPowers = powersData;
      // print('Преобразование полномочий PowersToMap : пустая строка');
    }
    final powerKeys = powersData.keys.toList();

    for (int i = 0; i < powerKeys.length; i++) {
      transformedPowers[powerKeys[i]] = numberPowers[i] == '1' ? true : false;
    }
    // print('Преобразование полномочий PowersToMap : $transformedPowers');
    return transformedPowers;
  }

  static String transformationPowersToString(Map<String, bool>? powersMap) {
    String powersString = '';
    if (powersMap == null || powersMap.isEmpty) {
      powersMap = powersData;
      // print('Преобразование полномочий PowersToString : пустая карта');
    }
    final powerKeys = powersData.keys.toList();

    for (int i = 0; i < powerKeys.length; i++) {
      powersString += powersMap[powerKeys[i]] == true ? '1' : '0';
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
    Map<String, bool>? powers,
  })  : powers = powers ?? defaultPowers();

  StaffData copyWith({
  int? id,
  String? login,
  String? password,
  String? position,
  Map<String, bool>? powers,
}) {
  return StaffData(
    id: id ?? this.id,
    login: login ?? this.login,
    password: password ?? this.password,
    position: position ?? this.position,
    powers: powers != null
        ? Map<String, bool>.from(powers)
        : Map<String, bool>.from(this.powers ?? {}),
  );
}
}

Map<String, bool> powersData = {
  'страница заказы': false, // 0
  'страница оплата': false, // 1
  'совершать возврат': false, // 2
  'страница склад': false, // 3
  'страница закупки': false, // 4
  'страница персонал': false, // 5
  'страница таблицы': false, // 6
  'страница создание_блюда': false, // 7
  'страница отчет': false, // 8
  'страница настройки': false, // 9
};

Map<String, bool> defaultPowers() =>
    Map<String, bool>.from(powersData);