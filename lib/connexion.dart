import 'package:flutter/material.dart';

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
              SizedBox(height: 60,),
              ElevatedButton.icon(
                  onPressed : () {
                    //local_auth function
                  },
                  icon: Icon(Icons.fingerprint,size:30),
                  label: Text("conexion avec l'empreinte"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  )
                    )

            ],
          ),
        ),
      ),
    );
  }
}
