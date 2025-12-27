class StaffData {
  int id;
  String login;
  String password;
  String position; // должность
  Map<String, bool>? powers; // полномочия

  static Map<String, bool> transformationPowers(String? numberPowers) {
    Map<String, bool> transformedPowers = {};
    if (numberPowers == null || numberPowers.isEmpty) {
      transformedPowers = powersData;
    }
    final powerKeys = powersData.keys.toList();
    for (int i = 0; i < powerKeys.length; i++) {
      transformedPowers[powerKeys[i]] =
          numberPowers!.length > i && numberPowers[i] == '1' ? true : false;
    }
    return transformedPowers;
  }

  StaffData({
    this.id = 0,
    required this.login,
    required this.password,
    required this.position,
    Map<String, bool>? powers,
  }) : powers = powersData;
}

const Map<String, bool> powersData = {
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
