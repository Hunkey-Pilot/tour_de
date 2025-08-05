import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightThemeData {
    return ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: AppColors.getMaterialColor(AppColors.themeColor)
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: UnderlineInputBorder(),
          enabledBorder: _getThemeColor(AppColors.themeColor),
          errorBorder: _getThemeColor(Colors.red),

        )
    );
  }
  static UnderlineInputBorder _getThemeColor(Color color){
    return UnderlineInputBorder(
      borderSide: BorderSide(
          color: color,
          width: 1.2
      ),
    );
  }
}