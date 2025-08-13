import 'package:shared_preferences/shared_preferences.dart';

class PasswordSP {
  final sharedPreferences = SharedPreferences.getInstance();

  Future<String> loadValue() async {
    final password = (await sharedPreferences).getString('password') ?? '';
    return password;
  }

  Future<void> saveValue(password) async {
    (await sharedPreferences).setString('password', password);
  }
}