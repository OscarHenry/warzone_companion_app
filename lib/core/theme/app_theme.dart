import 'package:flutter/material.dart';

const appThemeMode = ThemeMode.dark;

final ThemeData appThemeLight = ThemeData.light(useMaterial3: true).copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.green,
  ),
);

final ThemeData appThemeDark = ThemeData.dark(useMaterial3: true).copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.green,
  ),
);
