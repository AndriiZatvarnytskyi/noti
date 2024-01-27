import 'package:flutter/material.dart';
import 'package:noti/const/colors.dart';

ThemeData lightTheme() {
  return ThemeData(
      // ignore: deprecated_member_use
      errorColor: kErrorColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          backgroundColor: const MaterialStatePropertyAll(kPrimaryColor),
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
      hintColor: kHintColor,
      primaryColor: kPrimaryColor,
      disabledColor: kDisableColor,
      appBarTheme: const AppBarTheme(
        shadowColor: Color.fromRGBO(0, 0, 0, 1),
        backgroundColor: kAppBarColor,
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        elevation: 0,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        errorStyle: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w400, color: kErrorColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: kHintColor, width: 1),
        ),
        // Бордер у нормальному стані
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: kHintColor, width: 1),
        ),
        // Бордер при фокусуванні
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: kPrimaryColor, width: 1),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide:
              BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 1),
        ),
      ),
      textTheme: const TextTheme(
        labelMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: kAppBarColor,
        ),
        labelLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: kAppBarColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: kBodyTextColor,
        ),
        bodyLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: kPrimaryColor,
        ),
        titleSmall: TextStyle(
          color: kMainTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: kMainTextColor,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          color: kMainTextColor,
          fontSize: 32,
          fontWeight: FontWeight.w700,
        ),
      ));
}
