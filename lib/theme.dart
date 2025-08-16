import 'package:fastfood/names/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomTheme {
  final Color black;
  final Color white;
  final Color colorTheme;
  final Color colorText;
  final Color colorButton;
  final Color colorTextInButton;
  final Color colorThemeText;
  final Color colorBackground;
  final Color colorBorder;
  final Color colorBorderKub;
  CustomTheme({required BuildContext context
      // required this.black,
      // required this.white,
      // required this.colorTheme,
      // required this.colorBackground,
      })
      : black = Theme.of(context).colorScheme.onSecondary,
        white = Theme.of(context).colorScheme.onPrimary,
        colorBackground = Theme.of(context).colorScheme.surface,
        colorTheme = Theme.of(context).colorScheme.secondaryContainer,
        colorText = Theme.of(context).colorScheme.onSecondary,
        colorButton = Theme.of(context).colorScheme.onSecondary,
        colorTextInButton = Colors.blueGrey,
        colorThemeText = Colors.blueGrey,
        colorBorder = Theme.of(context).colorScheme.onSecondary,
        colorBorderKub = Colors.blueGrey;
}

Color primary = const Color.fromARGB(255, 254, 255, 253);
// const primaryColor = Colors.black;
// extension CustomThemeData on ThemeData{
//   Widget? icon;
// }
final darkTheme = ThemeData(
    fontFamily: 'Verdana',
    useMaterial3: true,
    textTheme: textTheme,
    // scaffoldBackgroundColor: Color.fromARGB(a, r, g, b);
    colorScheme: ColorScheme.fromSeed(
        surface: const Color.fromARGB(255, 37, 37, 37), // colorBackground
        primary: primary,
        seedColor: primary,
        onSecondary: Colors.white,
        onPrimary: Colors.black,
        secondaryContainer: Colors.blueGrey,
        brightness: Brightness.dark));

ThemeData lightTheme = ThemeData(
    fontFamily: 'Verdana',
    textTheme: textTheme,
    useMaterial3: true,
    // scaffoldBackgroundColor: Color.fromARGB(a, r, g, b);
    colorScheme: ColorScheme.fromSeed(
        surface: primary,
        primary: primary,
        seedColor: primary,
        onSecondary: Colors.black,
        secondaryContainer: Colors.blueGrey,
        onPrimary: Colors.white,
        brightness: Brightness.light));

final textTheme = const TextTheme(
  titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
  headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
);

String themeChoice = 'light';

Future<String> getTheme() async {
  final prefs = await SharedPreferences.getInstance();
  return themeChoice = prefs.getString('theme') ?? 'light';
  // if (prefs.containsKey('theme')) {
  //   themeChoice = prefs.getString('theme') ?? 'light';
  // }
  // context.read<ThemeCubit>().setThemeBrightness(themeChoice);
}

Future<void> setTheme(BuildContext context, bool onPress) async {
  themeChoice = onPress ? 'dark' : 'light';
  // context.read<ThemeCubit>().setThemeBrightness();
  context.read<ThemeCubit>().updateTheme(themeChoice, context);

  final prefs = await SharedPreferences.getInstance();
  prefs.setString('theme', themeChoice);
}
