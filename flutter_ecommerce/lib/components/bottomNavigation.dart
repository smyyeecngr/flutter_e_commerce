import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget bottomNavigationBar(String page) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0, -3),
              color: Colors.black.withOpacity(0.25),
              blurRadius: 10)
        ],
        color: Color(0xFFEFF5F8),
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildNawIcon(iconData: Icons.home_filled, active: page == "home"),
          buildNawIcon(iconData: Icons.search, active: page == "search"),
          buildNawIcon(iconData: Icons.shopping_basket, active: page == "cart"),
          buildNawIcon(iconData: Icons.person, active: page == "profile"),
        ],
      ),
    ),
  );
}

Widget buildNawIcon({required IconData iconData, required bool active}) {
  return Icon(iconData,
      size: 20, color: Color(active ? 0xFF0001FC : 0xFF0A1034));
}
