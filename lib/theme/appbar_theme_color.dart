import 'package:flutter/material.dart';

class AppBarThemeColor extends StatelessWidget {
  const AppBarThemeColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color> [
            Colors.white,
            Colors.white,
          ]
        ),
      ),
    );
  }
}