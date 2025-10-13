import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ParcoursController {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;



  Future<void>saveArtwork({
    required BuildContext context,
    required String title,
    required String imageUrl,
    required String artist,
    required String date,
  })
  async {
    final user = auth.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Connectez-vous pour enregistrer cette œuvre.')),
      );
      return;
    }
    try {
      await firestore
          .collection('users')
          .doc(user.uid)
          .collection('parcours')
          .add({
        'title': title,
        'imageUrl': imageUrl,
        'artist': artist,
        'date': date,
        'savedAt': DateTime.now(),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Oeuvre enregistrée dans votre parcours.')));
          } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur lors de l’enregistrement : $e')),
        );
        print('Erreur lors de l’enregistrement : $e');
      }

  }

}