import 'package:flutter/material.dart';

import '../widgets/navigation_bar_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(),
      bottomNavigationBar: NavigationBarApp(),
    );
  }
}
