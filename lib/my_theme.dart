import 'package:flutter/material.dart';

class MyTheme{
  static Color primaryLight = Color(0xff5D9CEC);
  static Color primaryDark = Color(0xff141922);
  static Color backgroundColorLight = Color(0xffDFECDB);
  static Color greenColor = Color(0xff61E757);
  static Color redColor = Color(0xffEC4B4B);
  static Color whiteColor = Color(0xffffffff);
  static Color blackColor = Color(0xff383838);
  static Color greyColor = Color(0xffC8C9CB);
  static Color blackColorDark = Color(0xff141922);
  static Color backgroundColorDark = Color(0xff060E1E);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: backgroundColorLight,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: primaryLight
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryLight,
      unselectedItemColor: blackColor,
      backgroundColor: Colors.transparent,
      elevation: 0
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryLight
    ),
    bottomSheetTheme: BottomSheetThemeData(
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15)
        ),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: whiteColor
      ),
      titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: blackColor
      ),
      titleSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: blackColor
      ),
    )
  );
  static ThemeData darkTheme = ThemeData();


}