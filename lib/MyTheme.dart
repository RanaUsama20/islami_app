import 'package:flutter/material.dart';

class MyTheme{
  static Color blackColor = const Color(0xff242424);
  static Color primaryLight = const Color(0xffB7935F);
  static Color yellowColor = const Color(0xffFACC1D);
  static Color whiteColor = const Color(0xffF8F8F8);
  static Color beigeColor = const Color(0xff8d6e40);




  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLight,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
          color: MyTheme.blackColor
      ),
      color: Colors.transparent,
      centerTitle: true,
      elevation: 0
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: blackColor,
      unselectedItemColor: whiteColor,
      

    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        color: blackColor
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w600,
        color:  blackColor,
        fontSize: 25
      )
    )
  );
  static ThemeData darkTheme = ThemeData(
      primaryColor: yellowColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
              color: MyTheme.whiteColor
          ),
          color: Colors.transparent,
          centerTitle: true,
          elevation: 0
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: yellowColor,
        unselectedItemColor: whiteColor,


      ),
      textTheme: TextTheme(
          titleMedium: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: whiteColor
          ),
          titleSmall: TextStyle(
              fontWeight: FontWeight.w600,
              color:  yellowColor,
              fontSize: 25
          )
      )
  );
}