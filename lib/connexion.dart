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
          // Background image
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/connexion.png"), // ton background
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo en haut
              Image.asset(
                "assets/logo.png", // ton logo
                width: 85,
                height: 85,
              ),
              const SizedBox(height: 30),

              // Texte de bienvenue
              const Text(
                "Connexion",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 5,
                      color: Colors.black54,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),

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

                    // 3️⃣ Feedback
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
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.fingerprint,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

