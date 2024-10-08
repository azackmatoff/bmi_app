import 'package:bmi_app/shared/constants/app_colors.dart';
import 'package:bmi_app/shared/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
    ),
    textTheme: const TextTheme(
      headlineLarge: AppTextStyles.headlineLarge,
      bodyLarge: AppTextStyles.bodyLarge,
      titleLarge: AppTextStyles.titleLarge,
      headlineMedium: AppTextStyles.headlineMedium,
    ),
    useMaterial3: true,
  );
}
