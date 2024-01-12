import 'package:flutter/material.dart';
import 'package:pgproject/calculator/ui/calculator_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CalculatorPage(),
                ),
              );
            },
            child: const Text("Go Calculator Page"),
          ),
        );
      }),
    );
  }
}
