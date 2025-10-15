import 'package:cultureloop/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../controller/user_controller.dart';

class ModalInscription extends StatelessWidget {
  const ModalInscription({
    super.key,
    required this.mounted,
  });

  final bool mounted;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          builder: (BuildContext context) {
            return SizedBox(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
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
                        print("Erreur d'authentification: $e");
                      }
                    },
                    icon: Image.asset(
                      "assets/Google.svg.png",
                      height: 24,
                    ),
                    label: const Text("Sign-in with Google"),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
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
                        print("Erreur d'authentification: $e");
                      }
                      ;
                    },
                    icon: Icon(Icons.facebook),
                    label: const Text("Sign-in with Facebook"),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
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
                        print("Erreur d'authentification: $e");
                      }
                      ;
                    },
                    icon: Icon(Icons.apple),
                    label: const Text("Sign-in with Apple"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Close "),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: const Text("Don't have an account yet ?"),
    );
  }
}
