import 'package:cultureloop/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../controller/user_controller.dart';

class LoginButtonFaceBook extends StatelessWidget {
  const LoginButtonFaceBook({
    super.key,
    required this.mounted,
  });

  final bool mounted;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        try {
          final user = await UserController().loginwithFacebook();
          if (user != null && mounted) {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const HomePage(),
              ),
            );
          }
        } on FirebaseAuthException catch (e) {
          print("Probleme with Facebook login : $e");
        }
        ;
      },
      icon: Icon(Icons.facebook),
      label: Text("Login with Facebook"),
    );
  }
}
