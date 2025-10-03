import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _message = "";

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
                "Connexion",
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

              GestureDetector(
                onTap: () async {
                  final LocalAuthentication auth = LocalAuthentication();
                  final List<BiometricType> availableBiometrics =
                  await auth.getAvailableBiometrics();
                  if (availableBiometrics.contains(BiometricType.strong) ||
                      availableBiometrics.contains(BiometricType.face)) {
                    bool authenticated = false;
                    try {
                      authenticated = await auth.authenticate(
                        localizedReason:
                        "Veuillez vous identifier avec votre empreinte",
                        options: const AuthenticationOptions(
                          biometricOnly: true,
                          stickyAuth: true,
                        ),
                      );
                    } catch (e) {
                      print("Erreur d'authentification: $e");
                    }
                    setState(() {
                      _message = authenticated
                          ? "Authentification réussie !"
                          : "Échec de l'authentification";
                    });

                    if (authenticated) {
                      // Navigator.pushReplacement(...) si tu veux passer à la page suivante
                    }
                  } else {
                    setState(() {
                      _message =
                      "Aucun capteur biométrique compatible disponible !";
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.fingerprint,
                    size: 80,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                _message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 40,),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Image.asset("assets/Google.svg.png",height: 24,),
                label: Text("Connexion avec google"),
              ),
              SizedBox(height: 20,),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.facebook),
                label: Text("Connexion avec facebook"),
              ),
              SizedBox(height: 20,),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.apple),
                label: Text("Connexion avec apple"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

