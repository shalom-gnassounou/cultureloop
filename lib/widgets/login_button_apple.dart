import 'package:cultureloop/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../controller/user_controller.dart';

class LoginButtonApple extends StatelessWidget {
  const LoginButtonApple({
    super.key,
    required this.mounted,
  });

  final bool mounted;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        try {
          final user = await UserController().loginwithApple();
          if (user != null && mounted) {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const HomePage(),
              ),
            );
          }
        } on FirebaseAuthException catch (e) {
          print("Probleme with Apple login : $e");
        }
        ;
      },
      icon: Icon(Icons.apple),
      label: Text("Login with Apple"),
    );
  }
}
