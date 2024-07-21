import 'package:calculator_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class PrimaryButon extends StatelessWidget {
  PrimaryButon({super.key, this.onPressed});

  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: primaryColor,
      child: const Text(
        'Calculate',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
