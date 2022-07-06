import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color fromHex(String hex) {
    String hexColor = hex.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}

Map<int, Color> swatchColor = {
  50: HexColor.fromHex("#ffffff"),
  100: HexColor.fromHex("#ededed"),
  150: HexColor.fromHex("#ededed"),
  200: HexColor.fromHex("#bfbfbf"),
  250: HexColor.fromHex("#8e8e8e"),
  300: HexColor.fromHex("#7f7f7f"),
  350: HexColor.fromHex("#282727"),
  400: HexColor.fromHex("#333333"),
  450: HexColor.fromHex("#2c2b2b"),
  500: HexColor.fromHex("#111111"),
  550: HexColor.fromHex("#4f4f4f"),
  600: HexColor.fromHex("#fe3f3f"),
  700: HexColor.fromHex("#e91b1a"),
  800: HexColor.fromHex("#bb0100"),
  900: HexColor.fromHex("#9e0100"),
  900: HexColor.fromHex("#fe3f3f"),
};

Color getColor(double opacity) => Color.fromRGBO(129, 9, 85, opacity);

Map<int, Color> foodAppCustomColor = {
  50: getWhiteColor(0.9),
  100: getWhiteColor(0.8),
  200: getWhiteColor(0.6),
  300: getWhiteColor(0.4),
  400: getWhiteColor(0.2),
  500: getWhiteColor(0),
  600: getWhiteColor(0.1),
  700: getWhiteColor(0.2),
  800: getWhiteColor(0.3),
  900: getWhiteColor(0.4),
};
Color getWhiteColor(double opacity) => Color.fromRGBO(255, 255, 255, opacity);

final kMainRedColor = HexColor.fromHex("#E91C1A");
final kDrawerBackGroundColour = HexColor.fromHex("#2c2b2c");
