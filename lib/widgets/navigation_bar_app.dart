import 'package:flutter/material.dart';

Widget NavigationBarApp() {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    items: [
      BottomNavigationBarItem(
        label: 'Home',
        icon: Icon(Icons.home),
      ),
      BottomNavigationBarItem(
        label: 'Collections',
        icon: Icon(Icons.library_add),
      ),
      BottomNavigationBarItem(
        label: 'Parcours',
        icon: Icon(Icons.mode_of_travel),
      ),
      BottomNavigationBarItem(
        label: 'Maps',
        icon: Icon(Icons.map),
      ),
    ],
  );
}
