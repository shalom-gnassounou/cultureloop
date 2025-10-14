import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../controller/parcour_controller.dart';


class VueDetail extends StatelessWidget {
 VueDetail({super.key});
  final ParcoursController parcoursController = ParcoursController();

  Future<void> downloadImage(BuildContext context, String imageUrl, String title) async {
    try {
      var status = await Permission.storage.request();
      if (!status.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Permission de stockage refusée')),
        );
        return;
      }
      Directory? directory;
      if (Platform.isAndroid) {
        directory = Directory('/storage/emulated/0/Download');
      } else {
        directory = await getApplicationDocumentsDirectory();
      }
      String fileName = '${title.replaceAll(" ", "_")}.jpg';
      String filePath = '${directory.path}/$fileName';
      await Dio().download(imageUrl, filePath);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image enregistrée dans Téléchargements ')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors du téléchargement : $e')),
      );
    }
  }



      @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> object =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??
        {};

    final String title = object['title'] ?? 'Titre inconnu';
    final String imageUrl = object['primaryImage'] ?? '';
    final String creditLine = object['creditLine'] ?? '';
    final String department = object['department'] ?? '';
    final String artistDisplayName = object['artistDisplayName'] ?? 'Artiste inconnu';
    final String artistDisplayBio = object['artistDisplayBio'] ?? '';
    final String classification = object['classification'] ?? '';
    final String accessionYear = object['accessionYear'] ?? '';
    final String medium = object['medium'] ?? '';
    final String dimensions = object['dimensions'] ?? '';
    final String period = object['period'] ?? '';
    final String objectDate = object['objectDate'] ?? '';


    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          imageUrl.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: 300,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                )
              : Container(
                  height: 300,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image, size: 100),
                ),
          const SizedBox(height: 8),
          if (creditLine.isNotEmpty)
            Text(
              creditLine,
              style: const TextStyle(
                fontSize: 10,
                fontStyle: FontStyle.italic,
              ),
            ),
          const SizedBox(height: 16),
          const Divider(thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.favorite_border, size: 30),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.photo_camera, size: 30),
                onPressed: () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? photo = await picker.pickImage(source: ImageSource.camera);
                  if (photo != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Photo prise avec succès !')),
                    );
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Aucune photo prise.')),
                      );}
                }
              ),
              IconButton(
                icon: const Icon(Icons.border_color, size: 30),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.download, size: 30),
                onPressed: () {
                  if (imageUrl.isNotEmpty) {
                    downloadImage(context, imageUrl, title);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Aucune image à télécharger.")),
                    );
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.bookmark_border),
                onPressed: () {
                  parcoursController.saveArtwork(
                    context: context,
                    title: title,
                    imageUrl: imageUrl,
                    artist: artistDisplayName,
                    date: objectDate,
                  );
                },
              ),
            ],
          ),
          const Divider(thickness: 1),
          const SizedBox(height: 16),
          if (department.isNotEmpty)
            Text(
              department,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          const SizedBox(height: 8),
          Text(
            artistDisplayName,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              color: Color(0xFFC6A169),
            ),
          ),
          if (artistDisplayBio.isNotEmpty)
            Text(
              artistDisplayBio,
              style: const TextStyle(fontSize: 16),
            ),
          const SizedBox(height: 16),
          _buildInfoBlock('Classification', classification),
          _buildInfoBlock('Date', objectDate),
          _buildInfoBlock("Année d'acquisition", accessionYear),
          _buildInfoBlock('Medium', medium),
          _buildInfoBlock('Dimensions', dimensions),
          _buildInfoBlock('Période', period),

          const SizedBox(height: 36),
          Row(
            children: const [
              Text(
                "Paint",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.border_color, size: 24),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: const Center(
                      child: Text(
                        "Zone de dessin",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.edit, size: 30, color: Colors.black),
                      Icon(Icons.edit, size: 30, color: Colors.red),
                      Icon(Icons.edit, size: 30, color: Colors.blue),
                      Icon(Icons.edit, size: 30, color: Colors.green),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBlock(String label, String value) {
    if (value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        '$label: $value',
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
