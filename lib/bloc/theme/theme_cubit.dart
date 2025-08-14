import 'package:equatable/equatable.dart';
import 'package:fastfood/shared_pr/themeSP.dart';
import 'package:fastfood/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(BuildContext context)
    : super(ThemeState(themeChoice, Icon(Icons.brightness_5_outlined))) {
    loadTheme();
  }
  final themeSP = ThemeSP();
  //   Color mmm = themeChoice.onSecondary;
  // Theme.of(context).colorScheme.onSecondary,
  // Future<void> setThemeBrightness() async {
  //   // final prefs = await SharedPreferences.getInstance();
  //   // prefs.setString('theme', theme);
  //   emit(ThemeState(
  //     themeChoice,
  //     Colors.blueGrey,
  //   Theme.of(context).colorScheme.onSecondary,
  //   Theme.of(context).colorScheme.onPrimary,
  //   Theme.of(context).colorScheme.onSurface
  //     ));
  // }
  Future<void> loadTheme() async {
    final loadTheme = themeSP.loadValue();
    themeChoice = await loadTheme;
    if (themeChoice == 'light') {
      emit(ThemeState(themeChoice, Icon(Icons.brightness_5_outlined)));
    } else {
      emit(ThemeState(themeChoice, Icon(Icons.brightness_2)));
    }
    // emit(ThemeState(themeChoice, Icon(Icons.brightness_5_outlined)));
  }

  Future<void> saveTheme(newThemeChoice) async {
    themeChoice = newThemeChoice;
    // if(themeChoice == 'light') {
    //   emit(ThemeState(themeChoice, Icon(Icons.brightness_5_outlined)));
    // } else {
    //   emit(ThemeState(themeChoice, Icon(Icons.brightness_2)));
    // }
    await themeSP.saveValue(themeChoice);
  }

  void updateTheme(String newTheme, BuildContext context) {
    saveTheme(newTheme);
    if (themeChoice == 'light') {
      emit(ThemeState(themeChoice, Icon(Icons.brightness_5_outlined)));
    } else {
      emit(ThemeState(themeChoice, Icon(Icons.brightness_2)));
      // emit(ThemeState(themeChoice, Icon(Icons.brightness_5_outlined)));
    }
  }
}
