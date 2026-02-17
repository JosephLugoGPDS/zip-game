import 'package:app/core/resources/colors.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  void closeKeyBoard() => FocusScope.of(this).unfocus();

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  double get safeHeight =>
      MediaQuery.of(this).size.height -
      MediaQuery.of(this).padding.top -
      MediaQuery.of(this).padding.bottom;
  double get paddingTop => MediaQuery.of(this).padding.top;
  double get paddingBottom => MediaQuery.of(this).padding.bottom;
  double get safeHeightWithoutAppBar =>
      MediaQuery.of(this).size.height -
      MediaQuery.of(this).padding.top -
      MediaQuery.of(this).padding.bottom -
      kToolbarHeight;
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  void showSnackBar(String message, {Color? color}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      backgroundColor: color ?? AppColors.textAccentSubColor,
      content: Text(
        message,
        style: textTheme.titleMedium,
      ),
    ));
  }
}
