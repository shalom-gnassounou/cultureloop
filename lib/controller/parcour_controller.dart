import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cultureloop/service/model/art_work.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ParcoursController {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveArtwork({
    required BuildContext context,
    required String title,
    required String imageUrl,
    required String artist,
    required String date,

  }) async {
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
        const SnackBar(content: Text('Œuvre enregistrée dans votre parcours.')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de l’enregistrement : $e')),
      );
      print('Erreur lors de l’enregistrement : $e');
    }
  }

  Future<List<ArtWork>> getParcours() async {
    final user = auth.currentUser;
    if (user == null) {
      print("Aucun utilisateur connecté");
      return [];
    }

    try {
      QuerySnapshot snapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('parcours')
          .get();

      return snapshot.docs.map((doc) {
        return ArtWork.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    } catch (e) {
      print("Erreur lors de la récupération des parcours : $e");
      return [];
    }
  }
  Future<void> deleteArtwork(String documentId, BuildContext context) async {
    final user = auth.currentUser;
    if (user == null) {
      print("Aucun utilisateur connecté");
      return;
    }
    try {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('parcours')
          .doc(documentId)
          .delete();
      print("Objet supprimé avec succès");
    } catch (e) {
      print("Erreur lors de la suppression de l'objet : $e");
    }
  }
}
