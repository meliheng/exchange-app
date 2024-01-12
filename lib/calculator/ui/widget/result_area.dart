import 'package:flutter/material.dart';
import 'package:pgproject/calculator/constants/utility/text_styles.dart';

class ResultArea extends StatelessWidget {
  final String result;
  const ResultArea({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            blurRadius: 0.1,
            blurStyle: BlurStyle.normal,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        result,
        style: ProjectTextStyles.inpageTitleTextStyle,
      ),
    );
  }
}
