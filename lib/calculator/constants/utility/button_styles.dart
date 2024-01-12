import 'package:flutter/material.dart';
import 'package:pgproject/calculator/constants/theme/colors.dart';

class ProjectButtonStyles {
  ButtonStyle passiveButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black,
    // backgroundColor: Colors.grey[300],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
  ButtonStyle activeButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: ProjectMainColors.white,
    backgroundColor: ProjectMainColors.amber,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
  ButtonStyle menuButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: ProjectMainColors.white,
    backgroundColor: ProjectMainColors.amber,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
