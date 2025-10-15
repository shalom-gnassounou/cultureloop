import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import '../screens/home.dart';

class Firgerprint extends StatefulWidget {
  const Firgerprint({Key? key}) : super(key: key);

  @override
  _FirgerprintState createState() => _FirgerprintState();

}

class _FirgerprintState extends State<Firgerprint> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final LocalAuthentication auth = LocalAuthentication();
        bool canCheckBiometrics = await auth.canCheckBiometrics;

        if (!canCheckBiometrics) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("Erreur"),
              content: const Text("Aucun capteur biométrique détecté"),
            ),
          );
          return;
        }

        try {
          bool authenticated = await auth.authenticate(
            localizedReason: "Veuillez vous authentifier pour continuer",
            options: const AuthenticationOptions(
              biometricOnly: true,
              stickyAuth: true,
            ),
          );

          if (authenticated) {
            showDialog(
              context: context,
              builder: (_) => const AlertDialog(
                title: Text("Succès"),
                content: Text("Authentification réussie !"),
              ),
            );
             Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));
          } else {

            showDialog(
              context: context,
              builder: (_) => const AlertDialog(
                title: Text("Échec"),
                content: Text("Empreinte non reconnue."),
              ),
            );
          }
        } catch (e) {
          print("Erreur d'authentification: $e");
        }
      },
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.fingerprint,
          size: 80,
          color: Colors.black,
        ),
      ),
    );


  }
}
