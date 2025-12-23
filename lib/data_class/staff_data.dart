class StaffData {
  int id;
  String login;
  String password;
  String position; // должность
  Map<String, bool>? powers; // полномочия

  StaffData({
    required this.id,
    required this.login,
    required this.password,
    required this.position,
    Map<String, bool>? powers,
  }) : powers = powersData;
          //  {
          //    'страница_заказы': false, // 1
          //    'страница_оплата': false, // 2
          //    'совершать_возврат': false, // 3
          //    'страница_склад': false, // 4
          //    'страница_закупки': false, // 5
          //    'страница_персонал': false, // 6
          //    'страница_таблицы': false, // 7
          //    'страница_создание_блюда': false, // 8
          //    'страница_отчет': false, // 9
          //    'страница_настройки': false, // 10
          //  };
}

const Map<String, bool> powersData = 
  {
  'страница_заказы': false, // 1
  'страница_оплата': false, // 2
  'совершать_возврат': false, // 3
  'страница_склад': false, // 4
  'страница_закупки': false, // 5
  'страница_персонал': false, // 6
  'страница_таблицы': false, // 7
  'страница_создание_блюда': false, // 8
  'страница_отчет': false, // 9
  'страница_настройки': false, // 10
  };

