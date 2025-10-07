import 'package:cultureloop/widgets/vue_detail.dart';
import 'package:flutter/material.dart';
import 'package:cultureloop/widgets/header_section.dart';
import '../widgets/navigation_bar_app.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderSection(),
            SizedBox(height:20),
            VueDetail(),
            SizedBox(height:100),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarApp(),
    );
  }
}
