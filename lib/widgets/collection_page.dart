import 'package:cultureloop/service/met_service.dart';
import 'package:flutter/material.dart';

class CollectionPage extends StatefulWidget {
  final int departmentId;
  final String title;

  const CollectionPage({
    super.key,
    required this.departmentId,
    required this.title,
  });

  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  final MetService _service = MetService();
  List<Map<String, dynamic>> objects = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchObjects();
  }

  Future<void> _fetchObjects() async {
    try {
      final fetchedObjects = await _service.getObjectsByDepartment(
        widget.departmentId,
      );
      setState(() {
        objects = fetchedObjects;
        isLoading = false;
      });
    } catch (e) {
      print('Erreur lors du chargement des objets : $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : objects.isEmpty
        ? const Center(
      child: Text(
        'Aucune œuvre trouvée',
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    )
        : ListView.separated(
      padding: const EdgeInsets.all(16.0),
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemCount: objects.length,
      itemBuilder: (context, index) {
        final object = objects[index];
        final String title = object['title'] ?? 'Titre inconnu';
        final String imageUrl = object['primaryImageSmall'] ?? '';

        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: imageUrl.isNotEmpty
                ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image, color: Colors.white),
                  );
                },
              ),
            )
                : Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.image, color: Colors.white),
            ),
            title: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: const Text("Détails de l'œuvre"),
            onTap: () {
              Navigator.pushNamed(context, '/detail', arguments: object);
            },
          ),
        );
      },
    );
  }
}
