part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final String theme;

  ThemeState(this.theme);

  // Future<void> getCounter() async {
  // final prefs = await SharedPreferences.getInstance();

  // if (prefs.containsKey('theme')) {
  //   theme = prefs.getString('theme') ?? 0;
  // }
// }
  @override
  List<Object> get props => [theme];
}
// class ThemeState {
//   const ThemeState(this.brightness);

//   final Brightness brightness;
//   List<Object> get props => [brightness];
// }
/* Загрузка данных */
