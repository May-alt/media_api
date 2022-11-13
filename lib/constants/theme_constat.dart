import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData ligthTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600
    ),
    bodyText2: TextStyle(
      color: Colors.blueGrey,
      fontWeight: FontWeight.w500,
    ),
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    elevation: 0.0,
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 20.0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.orange),
);


ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black26,
  textTheme: TextTheme(
    bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600),
    bodyText2: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Colors.black26,
    titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold),
    elevation: 0.0,
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black26,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 20.0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black26,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.orange),
);
