import 'package:flutter/material.dart';
import 'package:noti/const/colors.dart';

ThemeData lightTheme() {
  return ThemeData(
      errorColor: kErrorColor,
      // floatingActionButtonTheme: const FloatingActionButtonThemeData(
      //     backgroundColor: Color.fromARGB(255, 240, 240, 240),
      //     foregroundColor: Colors.black87,
      //     elevation: 3),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          backgroundColor: const MaterialStatePropertyAll(kPrimaryColor),
        ),
      ),
      primaryColor: kPrimaryColor,
      disabledColor: kDisableColor,
      appBarTheme: const AppBarTheme(
        shadowColor: Color.fromRGBO(0, 0, 0, 1),
        backgroundColor: kAppBarColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        elevation: 4,
      ),
      // timePickerTheme: const TimePickerThemeData(
      //   backgroundColor: Color.fromARGB(255, 240, 240, 240),
      //   hourMinuteShape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(8)),
      //   ),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(8)),
      //   ),

      //   hourMinuteColor: kLightScaffoldBackgroundColor,
      //   hourMinuteTextColor: kLightThemeTextColor,
      //   dialHandColor: Colors.black26,
      //   dialBackgroundColor: kLightScaffoldBaackgroundColor,
      //   hourMinuteTextStyle: TextStyle(
      //       color: kLightThemeTextColor,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 25),
      //   dayPeriodTextStyle: TextStyle(
      //       color: kLightThemeTextColor,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 20),
      //   helpTextStyle: TextStyle(
      //       fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
      //   inputDecorationTheme: InputDecorationTheme(
      //     border: InputBorder.none,
      //     contentPadding: EdgeInsets.all(20),
      //   ),
      //   dialTextColor: kLightThemeTextColor,
      //   entryModeIconColor: kLightScaffoldBackgroundColor,
      // ),

      inputDecorationTheme: const InputDecorationTheme(),
      // disabledColor: Colors.black87,
      // hintColor: Colors.black26,
      // primaryColor: kPrimaryColor,
      // primaryColorDark: const Color.fromARGB(255, 206, 167, 62),
      // primaryColorLight: const Color.fromRGBO(255, 206, 167, 62),
      // scaffoldBackgroundColor: kLightScaffoldBackgroundColor,
      // progressIndicatorTheme: const ProgressIndicatorThemeData(
      //     color: Color.fromARGB(255, 179, 179, 179)),
      // fontFamily: 'Futura',
      textTheme: const TextTheme(
        // labelMedium: TextStyle(
        //   color: kLightThemeTextColor,
        //   fontWeight: FontWeight.w300,
        //   fontSize: 16,
        // ),
        // displayLarge: TextStyle(
        //     color: kLightThemeTextColor,
        //     fontWeight: FontWeight.bold,
        //     fontSize: 36),
        // displayMedium: TextStyle(
        //     color: kLightThemeTextColor,
        //     fontWeight: FontWeight.bold,
        //     fontSize: 20),
        // displaySmall: TextStyle(
        //     color: kLightThemeTextColor,
        //     fontWeight: FontWeight.bold,
        //     fontSize: 17),
        // headlineMedium: TextStyle(
        //     color: kLightThemeTextColor,
        //     fontWeight: FontWeight.w400,
        //     fontSize: 16),
        // headlineSmall: TextStyle(
        //     color: kLightThemeTextColor,
        //     fontWeight: FontWeight.bold,
        //     fontSize: 14),
        // titleLarge: TextStyle(
        //     color: kLightThemeTextColor,
        //     fontWeight: FontWeight.w500,
        //     fontSize: 13),
        // bodyLarge: TextStyle(
        //     color: kLightThemeTextColor,
        //     fontWeight: FontWeight.normal,
        //     fontSize: 12),
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
