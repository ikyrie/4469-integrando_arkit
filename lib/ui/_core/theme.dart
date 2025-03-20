import 'package:flutter/material.dart';
import 'package:toca_moveis/ui/_core/fonts.dart';

import 'colors.dart';

abstract class ThemeApp {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    textTheme: ThemeData.light().textTheme.apply(
          fontFamily: AppFonts.montserrat,
        ),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.buttonPrimary),
    appBarTheme: AppBarTheme(
      elevation: 3,
      toolbarHeight: 64,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 22,
        color: AppColors.appBarForeground,
      ),
      foregroundColor: AppColors.appBarForeground,
      backgroundColor: AppColors.appBarBackground,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.bottomNavigationBarBackground,
      surfaceTintColor: AppColors.bottomNavigationBarBackground,
      indicatorColor: AppColors.bottomNavigationBarBackground,
      iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: AppColors.bottomNavigationBarSelected);
          }
          return IconThemeData(color: AppColors.bottomNavigationBarUnselected);
        },
      ),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      height: 80,
    ),
  );
}
