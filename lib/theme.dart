import 'package:flutter/material.dart';

class AppColors{
  static Color primaryColor =  Colors.blue;
  static Color primaryAccent =  Colors.black12;
  static Color secondaryColor =  Colors.blue;
  static Color secondaryAccent =  Colors.black;
  static Color titleColor =  Colors.deepPurple;
  static Color textColor =  Colors.white;
  static Color successColor =  Colors.white;
  static Color highlightColor =  Colors.pinkAccent;
  
}

ThemeData primaryTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,),
   
    scaffoldBackgroundColor: AppColors.secondaryAccent,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor.withOpacity(0.8),
      foregroundColor: AppColors.textColor,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
    ),

    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: AppColors.textColor,
        fontSize: 8,
        letterSpacing: 1,
      ),
      headlineMedium: TextStyle(
        color: AppColors.textColor,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
      titleMedium: TextStyle(
        color: AppColors.textColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
      )
    ),

    cardTheme: CardTheme(
      color: AppColors.secondaryColor,
      surfaceTintColor: Colors.black.withOpacity(0.2)
      ),


    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.secondaryColor.withOpacity(0.5),
      border: InputBorder.none,
      labelStyle: TextStyle(color: AppColors.textColor),
      prefixIconColor: AppColors.textColor,
    )

);