import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerItems {
  final String name;
  final IconData icon;
  DrawerItems({required this.icon, required this.name});

  static List<DrawerItems> get drawers {
    return [
      DrawerItems(icon: Icons.add_shopping_cart, name: "My Cart"),
      DrawerItems(icon: Icons.table_restaurant_outlined, name: "Tables"),
      DrawerItems(icon: Icons.chair_sharp, name: "Sofas"),
      DrawerItems(icon: Icons.chair_rounded, name: "Chairs"),
      DrawerItems(icon: Icons.add_box_outlined, name: "Cupboards"),
      DrawerItems(icon: Icons.account_box, name: "My Account"),
      DrawerItems(icon: Icons.location_on_sharp, name: "Store Locator"),
      DrawerItems(icon: FontAwesomeIcons.noteSticky, name: "My Orders"),
      DrawerItems(icon: Icons.logout, name: "Logout"),
    ];
  }
}
