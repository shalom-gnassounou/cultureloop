import 'package:flutter/material.dart';

class NavigationBarApp extends StatefulWidget {
  const NavigationBarApp({super.key});

  @override
  State<NavigationBarApp> createState() => _NavigationBarAppState();
}

class _NavigationBarAppState extends State<NavigationBarApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/home');
        break;
      case 2:
        print("Parcours cliqué (pas encore implémenté)");
        break;
      case 3:
        Navigator.pushNamed(context, '/maps');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const [
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
}
