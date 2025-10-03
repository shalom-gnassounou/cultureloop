import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF5F67EA),
      body: SingleChildScrollView(
     ),
        bottomNavigationBar: NavigationBar()
      );
   }
}
Widget NavigationBar(){
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
        label: 'home',
        icon: Icon(Icons.home),
      ),
      BottomNavigationBarItem(
        label: 'home',
        icon: Icon(Icons.home),
      ),
      BottomNavigationBarItem(
        label: 'home',
        icon: Icon(Icons.home),
      ),
    ],
  );
}
