
import 'package:cultureloop/widgets/category.dart';
import 'package:cultureloop/widgets/header_section.dart';
import 'package:flutter/material.dart';
import '../widgets/navigation_bar_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(),
            const SizedBox(height: 16),
            CategorySection(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarApp(),
    );
  }
}
