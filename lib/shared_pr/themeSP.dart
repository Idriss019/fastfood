import 'package:shared_preferences/shared_preferences.dart';

class ThemeSP {
  final sharedPreferences = SharedPreferences.getInstance();

  Future<String> loadValue() async {
    final themeChoice = (await sharedPreferences).getString('themeChoice') ?? '';
    return themeChoice;
  }

  Future<void> saveValue(themeChoice) async {
    (await sharedPreferences).setString('themeChoice', themeChoice);
  }
}