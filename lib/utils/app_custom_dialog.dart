import 'package:flutter/material.dart';
import 'package:weather_app/widgets/app_button.dart';

class AppCustomDialog {
  static void showCustomDialog({
    required BuildContext context,
    required String title,
    required String buttonTitle,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xffF5F5F5),
          title: Text(title),
          actions: [
            AppButton(
              title: buttonTitle,
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
