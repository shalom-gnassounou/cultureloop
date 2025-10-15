import 'package:cultureloop/screens/home.dart';
import 'package:cultureloop/widgets/modal_inscription.dart';
import 'package:cultureloop/widgets/login_button_apple.dart';
import 'package:cultureloop/widgets/login_button_face_book.dart';
import 'package:cultureloop/widgets/login_button_google.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import '../widgets/firgerprint.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/connexion.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: Image.asset(
                  "assets/logo.png",
                  width: 85,
                  height: 85,
                ),
              ),
              SizedBox(height: 30),

              const Text(
                "Log-in",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 5,
                      color: Colors.black54,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Firgerprint(),

              SizedBox(height: 20),

              SizedBox(
                height: 40,
              ),
              LoginButton(mounted: mounted),
              SizedBox(
                height: 20,
              ),
              LoginButtonFaceBook(mounted: mounted),
              SizedBox(
                height: 20,
              ),
              LoginButtonApple(mounted: mounted),
              SizedBox(
                height: 30,
              ),
              ModalInscription(mounted: mounted),
            ],
          ),
        ),
      ),
    );
  }
}
