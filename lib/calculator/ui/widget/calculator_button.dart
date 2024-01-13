import 'package:flutter/material.dart';
import 'package:pgproject/calculator/constants/utility/button_styles.dart';
import 'package:pgproject/calculator/constants/utility/text_styles.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final double width;
  final void Function()? onPressed;
  const CalculatorButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 70,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: width,
      child: ElevatedButton(
        style: ProjectButtonStyles().activeButtonStyleR5,
        onPressed: onPressed,
        child: Text(
          text,
          style: ProjectTextStyles.smallTextStyle,
        ),
      ),
    );
  }
}
