import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class AuthFinger extends StatefulWidget {
  const AuthFinger({super.key});

  @override
  State<AuthFinger> createState() => _AuthFingerState();
}

class _AuthFingerState extends State<AuthFinger> {
  final LocalAuthentication authentication = LocalAuthentication();

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await authentication.authenticate(
        localizedReason: "Veuillez vous identifiez avec votre empreinte",
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
    } catch (errors) {
      print("erreurs: $errors");
    }
    if (authenticated) {
      print("Authentification réussie !");
      // Navigator.pushReplacement(...);
    } else {
      print("echec");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }


}


class Connexion extends StatelessWidget {
  const Connexion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/connexion.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: Image.asset("assets/logo.png", height: 85, width: 85),
              ),
              Text(
                "-Connexion-",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 60),
              ElevatedButton.icon(
                onPressed:(){

                },
                icon: Icon(Icons.fingerprint, size: 30),
                label: Text("conexion avec l'empreinte"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
