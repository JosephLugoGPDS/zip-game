import 'package:app/core/resources/colors.dart';
import 'package:flutter/material.dart' show ColorScheme, Brightness;

const ColorScheme appColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.primaryColor,
  onPrimary: AppColors.textPrimaryColor,
  primaryContainer: AppColors.primaryColor,
  onPrimaryContainer: AppColors.primaryColor,
  secondary: AppColors.whiteColor,
  onSecondary: AppColors.textLightColor,
  secondaryContainer: AppColors.primaryColor,
  onSecondaryContainer: AppColors.primaryColor,
  error: AppColors.primaryColor,
  onError: AppColors.primaryColor,
  surface: AppColors.scaffoldColor, //background
  onSurface: AppColors.textColor, //body color
  onSurfaceVariant: AppColors.primaryColor,
  outline: AppColors.primaryColor,
);
