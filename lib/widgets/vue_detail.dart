import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../controller/parcour_controller.dart';

class VueDetail extends StatefulWidget {
  const VueDetail({super.key});

  @override
  State<VueDetail> createState() => _VueDetailState();
}

class _VueDetailState extends State<VueDetail> {
  final ParcoursController parcoursController = ParcoursController();
  final GlobalKey _drawingKey = GlobalKey();

  // Variables pour le dessin
  List<DrawingPoint?> drawingPoints = [];
  Color color = Colors.black;

  Future<void> downloadImage(
      BuildContext context,
      String imageUrl,
      String title,
      ) async {
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
    final String artistDisplayName =
        object['artistDisplayName'] ?? 'Artiste inconnu';
    final String artistDisplayBio = object['artistDisplayBio'] ?? '';
    final String classification = object['classification'] ?? '';
    final String accessionYear = object['accessionYear'] ?? '';
    final String medium = object['medium'] ?? '';
    final String dimensions = object['dimensions'] ?? '';
    final String period = object['period'] ?? '';
    final String objectDate = object['objectDate'] ?? '';

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                title,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
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
                style: const TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
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
                    final XFile? photo = await picker.pickImage(
                      source: ImageSource.camera,
                    );
                    if (photo != null) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('Picture taken !')));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('No picture taken.')),
                      );
                    }
                  },
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
                        const SnackBar(content: Text("No image to download.")),
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
                      department: department,
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
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
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
              Text(artistDisplayBio, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            _buildInfoBlock('Classification', classification),
            _buildInfoBlock('Date', objectDate),
            _buildInfoBlock("Accession Year", accessionYear),
            _buildInfoBlock('Medium', medium),
            _buildInfoBlock('Dimensions', dimensions),
            _buildInfoBlock('Period', period),

            const SizedBox(height: 36),
            Row(
              children: const [
                Text(
                  "Paint",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                SizedBox(width: 8),
                Icon(Icons.border_color, size: 24),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    key: _drawingKey,
                    width: double.infinity,
                    height: 600,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: GestureDetector(
                      onPanUpdate: (DragUpdateDetails details) {
                        RenderBox? box = _drawingKey.currentContext?.findRenderObject() as RenderBox?;
                        if (box != null) {
                          Offset localPosition = box.globalToLocal(details.globalPosition);

                          // Vérifier que le point est dans les limites du cadre
                          if (localPosition.dx >= 0 &&
                              localPosition.dx <= box.size.width &&
                              localPosition.dy >= 0 &&
                              localPosition.dy <= box.size.height) {
                            setState(() {
                              drawingPoints = List.from(drawingPoints)
                                ..add(DrawingPoint(localPosition, color));
                            });
                          }
                        }
                      },
                      onPanEnd: (DragEndDetails details) {
                        setState(() {
                          drawingPoints.add(null);
                        });
                      },
                      child: CustomPaint(
                        painter: DrawingPainter(drawingPoints),
                        size: Size.infinite,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 30,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: color == Colors.black
                              ? Colors.grey.withOpacity(0.3)
                              : Colors.transparent,
                        ),
                        onPressed: () {
                          setState(() {
                            color = Colors.black;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.red,
                          size: 30,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: color == Colors.red
                              ? Colors.grey.withOpacity(0.3)
                              : Colors.transparent,
                        ),
                        onPressed: () {
                          setState(() {
                            color = Colors.red;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.blue,
                          size: 30,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: color == Colors.blue
                              ? Colors.grey.withOpacity(0.3)
                              : Colors.transparent,
                        ),
                        onPressed: () {
                          setState(() {
                            color = Colors.blue;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.green,
                          size: 30,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: color == Colors.green
                              ? Colors.grey.withOpacity(0.3)
                              : Colors.transparent,
                        ),
                        onPressed: () {
                          setState(() {
                            color = Colors.green;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.refresh,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            drawingPoints = [];
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBlock(String label, String value) {
    if (value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text('$label: $value', style: const TextStyle(fontSize: 14)),
    );
  }
}

class DrawingPoint {
  Offset offset;
  Color color;

  DrawingPoint(this.offset, this.color);
}

class DrawingPainter extends CustomPainter {
  List<DrawingPoint?> drawingPoints;

  DrawingPainter(this.drawingPoints);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < drawingPoints.length - 1; i++) {
      if (drawingPoints[i] != null && drawingPoints[i + 1] != null) {
        var paint = Paint()
          ..color = drawingPoints[i]!.color
          ..isAntiAlias = true
          ..strokeWidth = 4
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke;

        canvas.drawLine(
            drawingPoints[i]!.offset,
            drawingPoints[i + 1]!.offset,
            paint
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
