import 'package:cultureloop/screens/collection.dart';
import 'package:cultureloop/screens/connexion.dart';
import 'package:cultureloop/screens/detail.dart';
import 'package:cultureloop/screens/home.dart';
import 'package:cultureloop/screens/itinerary.dart';
import 'package:cultureloop/screens/maps.dart';
import 'package:cultureloop/screens/user_profile_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Culture Loop',
     home: Itinerary(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/collection': (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          final Map<String, dynamic> params = (args is Map<String, dynamic>)
              ? args
              : {'departmentId': 0, 'title': 'Collection'};
          return CollectionScreen(
            departmentId: params['departmentId'] as int,
            title: params['title'] as String,
          );
        },

        '/detail': (context) => const Detail(),
        '/itinerary': (context) => const Itinerary(),
      },
    );
  }
}


