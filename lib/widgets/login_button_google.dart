import 'package:cultureloop/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../controller/user_controller.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.mounted,
  });

  final bool mounted;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        try {
          final user = await UserController().loginwithGoogle();
          if (user != null && mounted) {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const HomePage(),
              ),
            );
          }
        } on FirebaseAuthException catch (e) {
          print("Probleme with Google login : $e");
        }
        ;
      },
      icon: Image.asset(
        "assets/Google.svg.png",
        height: 24,
      ),
      label: Text("Login with Google"),
    );
  }
}
