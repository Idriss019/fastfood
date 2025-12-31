// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'staff_bloc.dart';

// class StaffState extends Equatable {
//   final List<StaffData> staffDataList;
//   final Map<String, List<dynamic>> powersMap;
//   final int selectColorInt; // Храним цвет как int (ARGB)

//   const StaffState({
//     this.powersMap = const {},
//     this.staffDataList = const [],
//     required this.selectColorInt, // Устанавливаем цвет как int (по умолчанию синий)
//   });

//   @override
//   List<Object> get props => [
//     powersMap,
//     staffDataList,
//     selectColorInt,
//   ];

//   StaffState copyWith({
//     List<StaffData>? staffDataList,
//     Map<String, List<dynamic>>? powersMap,
//     int? selectColorInt,
//   }) {
//     return StaffState(
//       staffDataList: staffDataList ?? this.staffDataList,
//       powersMap: powersMap ?? this.powersMap,
//       selectColorInt: selectColorInt ?? this.selectColorInt,
//     );
//   }
// }

// final class StaffInitial extends StaffState {
//   // Конструктор для начального состояния
//   const StaffInitial(): super(selectColorInt: Colors.blue.toARGB32()); // Устанавливаем дефолтное значение здесь
// }

class StaffState extends Equatable {
  final List<StaffData> staffDataList;
  final Map<String, List<dynamic>> powersMap;
  final StaffData staffPowers;

  // Один int для хранения всех компонентов цвета
  // final int colorRow; // Это будет представление цвета в формате ARGB

  const StaffState({
    this.powersMap = const {},
    this.staffDataList = const [],
    // this.colorRow = 0, // Храним все компоненты цвета в одной переменной
    this.staffPowers = const StaffData(
      login: '', 
      password: '', 
      position: '', 
      powers: {}
    ),
  });

  @override
  List<Object> get props => [
    powersMap,
    staffDataList,
    staffPowers,
    // colorRow, // Сравниваем цвет через его целочисленное представление
  ];

  // // Преобразуем цвет обратно в объект Color
  // Color get selectColor => Color(color);

  // // Метод для извлечения компонент цвета
  // int get red => (color >> 16) & 0xFF; // Извлекаем красный компонент
  // int get green => (color >> 8) & 0xFF; // Извлекаем зеленый компонент
  // int get blue => color & 0xFF; // Извлекаем синий компонент
  // int get alpha => (color >> 24) & 0xFF; // Извлекаем альфа компонент

  // Метод для создания нового состояния с возможностью изменить цвет
  StaffState copyWith({
    List<StaffData>? staffDataList,
    Map<String, List<dynamic>>? powersMap,
    StaffData? staffPowers,
    // int? colorRow, // Мы теперь работаем с цветом как с одним int
  }) {
    return StaffState(
      staffDataList: staffDataList ?? this.staffDataList,
      powersMap: powersMap ?? this.powersMap,
      staffPowers: staffPowers ?? this.staffPowers,
      // colorRow: colorRow ?? this.colorRow, // Передаем цвет как int
    );
  }
}

final class StaffInitial extends StaffState {
  // Конструктор для начального состояния, где передаем синий цвет
  const StaffInitial() : super(); // Синий цвет по умолчанию
}
