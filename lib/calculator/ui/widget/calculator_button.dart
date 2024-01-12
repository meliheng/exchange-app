import 'package:flutter/material.dart';
import 'package:pgproject/calculator/constants/utility/button_styles.dart';
import 'package:pgproject/calculator/constants/utility/text_styles.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final int flex;
  final void Function()? onPressed;
  const CalculatorButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: ElevatedButton(
        style: ProjectButtonStyles().activeButtonStyle,
        onPressed: onPressed,
        child: Text(
          text,
          style: ProjectTextStyles.smallTextStyle,
        ),
      ),
    );
  }
}
