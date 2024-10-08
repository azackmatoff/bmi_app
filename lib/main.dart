import 'package:bmi_app/app/bloc-way/cubit/home/view/cubit_home_view.dart';
import 'package:bmi_app/app/flutter-way/home/view/home_view.dart';

import 'package:bmi_app/shared/constants/app_theme.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyCubitApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI APP',
      theme: AppTheme.theme,
      home: const HomeView(),
    );
  }
}

class MyCubitApp extends StatelessWidget {
  const MyCubitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI APP',
      theme: AppTheme.theme,
      home: const CubitHomeView(),
    );
  }
}
