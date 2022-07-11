import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neostore/utils/constants.dart';

class DrawerItems {
  final String name;
  final IconData icon;
  DrawerItems({required this.icon, required this.name});

  static List<DrawerItems> get drawers {
    return [
      DrawerItems(icon: Icons.add_shopping_cart, name: kMyCart),
      DrawerItems(icon: Icons.table_restaurant_outlined, name: kTables),
      DrawerItems(icon: Icons.chair_sharp, name: kSofas),
      DrawerItems(icon: Icons.chair_rounded, name: kMyChairs),
      DrawerItems(icon: Icons.add_box_outlined, name: kCupboards),
      DrawerItems(icon: Icons.account_box, name: kMyAccount),
      DrawerItems(icon: Icons.location_on_sharp, name: kStoreLocators),
      DrawerItems(icon: FontAwesomeIcons.noteSticky, name: kMyOrders),
      DrawerItems(icon: Icons.logout, name: kLogOut),
    ];
  }
}
