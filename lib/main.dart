import 'package:flutter/material.dart';
import 'package:pgproject/calculator/constants/theme/project_theme.dart';
import 'package:pgproject/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ProjectThemes.lightTheme,
      home: const MainPage(),
    );
  }
}
