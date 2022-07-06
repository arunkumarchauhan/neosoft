import 'package:flutter/material.dart';
import 'package:neostore/utils/colors.dart';

ThemeData buildThemeData() {
  return ThemeData(
    primarySwatch:
        MaterialColor(HexColor.fromHex("#bb0100").value, swatchColor),
    textTheme: const TextTheme(
        headline1: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontSize: 45,
          fontFamily: 'Gotham',
        ),
        headline2: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontFamily: 'Gotham',
          fontSize: 18,
        ),
        headline3: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontFamily: 'Gotham',
          fontSize: 23,
        )),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 25,
      opacity: 1,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      iconColor: Colors.white,
      hintStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontFamily: 'Gotham',
        fontSize: 18,
      ),
      errorStyle: TextStyle(color: Colors.white),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        alignment: Alignment.center,
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontFamily: 'Gotham',
            fontWeight: FontWeight.w500,
            fontSize: 26,
            color: HexColor.fromHex("#E91C1A"),
          ),
        ),
      ),
    ),
  );
}
