import 'package:flutter/material.dart';
import 'package:app/core/resources/colors.dart';
import 'package:app/core/resources/theme.dart';
import 'package:app/core/style/text_styles.dart';

final lightTheme = _getTheme(brightness: Brightness.light);
final darkTheme = _getTheme(brightness: Brightness.dark);

ThemeData _getTheme({required Brightness brightness}) {
  const colorScheme = appColorScheme;
  final textTheme = getTextTheme(colorScheme);
  final primaryTextTheme = textTheme.apply(
    displayColor: colorScheme.onPrimary,
    bodyColor: colorScheme.onPrimary,
  );

  const iconTheme = IconThemeData(color: AppColors.whiteColor, size: 16);

  final buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(32),
  );
  const buttonPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 16);
  final buttonTextStyle = textTheme.titleMedium;

  return ThemeData(
    useMaterial3: false,
    brightness: brightness,
    colorScheme: colorScheme,
    textTheme: textTheme,
    primaryTextTheme: primaryTextTheme,
    scaffoldBackgroundColor: colorScheme.surface,
    disabledColor: AppColors.dividerColor,
    dividerTheme: DividerThemeData(
      color: colorScheme.outline,
      space: 1,
      thickness: 1,
    ),
    chipTheme: ChipThemeData(
      labelStyle: textTheme.titleSmall,
      backgroundColor: colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
      iconTheme: IconThemeData(color: colorScheme.secondary, size: 18),
      side: const BorderSide(width: 1, color: AppColors.buttonDisableColor),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide.none,
      ),
      color: colorScheme.secondary,
      surfaceTintColor: Colors.transparent,
      margin: EdgeInsets.zero,
    ),
    popupMenuTheme: PopupMenuThemeData(
      surfaceTintColor: colorScheme.onSecondary,
      shadowColor: null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    toggleButtonsTheme: const ToggleButtonsThemeData(
      constraints: BoxConstraints(minHeight: 16, minWidth: 16),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      showDragHandle: false,
      backgroundColor: colorScheme.onSecondary,
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: colorScheme.surface,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: AppColors.dividerColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      elevation: 0,
      selectedIconTheme: iconTheme,
      unselectedIconTheme: iconTheme,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: textTheme.titleLarge,
      backgroundColor: colorScheme.surface,
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: colorScheme.surface,
      surfaceTintColor: colorScheme.surface,
      titleTextStyle: textTheme.titleLarge,
      contentTextStyle: textTheme.bodyMedium,
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: colorScheme.error,
      contentTextStyle: primaryTextTheme.bodyLarge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.fromLTRB(16, 0, 8, 0),
    ),
    iconTheme: iconTheme,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: colorScheme.secondary,
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide.none,
      ),
      hintStyle: textTheme.bodyLarge,
      labelStyle: textTheme.bodyLarge!.copyWith(
        color: switch (brightness) {
          Brightness.light => Colors.black38,
          Brightness.dark => null,
        },
        fontWeight: FontWeight.normal,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorScheme.secondary,
      foregroundColor: Colors.white,
      iconSize: 24,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: buttonShape,
        padding: buttonPadding,
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        textStyle: buttonTextStyle,
        elevation: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: buttonShape,
        padding: buttonPadding,
        side: BorderSide(color: colorScheme.primary, width: 1),
        foregroundColor: colorScheme.primary,
        textStyle: buttonTextStyle,
        elevation: 0,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: buttonShape,
        padding: buttonPadding,
        foregroundColor: colorScheme.primary,
        textStyle: buttonTextStyle,
      ),
    ),
  );
}
