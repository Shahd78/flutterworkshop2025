import 'package:flutter/material.dart';
import 'dart:math';
import 'inputpage.dart';
void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
          elevation: 0,
          centerTitle: true,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const InputPage(),
    );
  }
}
