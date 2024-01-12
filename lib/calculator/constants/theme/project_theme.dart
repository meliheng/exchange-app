import 'package:flutter/material.dart';
import 'package:pgproject/calculator/constants/theme/colors.dart';

class ProjectThemes {
  static final lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "LatoLight",
      scaffoldBackgroundColor: ProjectMainColors.grey,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
      ),
      colorScheme: ColorScheme.light(
        primary: Colors.blueGrey.shade800,
        secondary: const Color.fromARGB(255, 23, 20, 173),
      ),
      iconTheme: const IconThemeData(color: Colors.black));
}
