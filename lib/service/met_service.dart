import 'dart:convert';
import 'package:http/http.dart' as http;

class MetService {
  static const baseurl = 'https://collectionapi.metmuseum.org/public/collection/v1';

  static Future<List<dynamic>> getCollection() async {
    final response = await http.get(Uri.parse('$baseurl/departments'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['departments'];
    } else {
      throw Exception('Failed to load departments');
    }
  }

  Future<List<Map<String, dynamic>>> getObjectsByDepartment(int departmentId, {int limit = 20}) async {
    final response = await http.get(Uri.parse('$baseurl/objects?departmentIds=$departmentId'));

    if (response.statusCode != 200) {
      throw Exception('Failed to load objects');
    }

    final List<dynamic> objectIds = json.decode(response.body)['objectIDs'] ?? [];

    if (objectIds.isEmpty) {
      return [];
    }
    final List<Map<String, dynamic>> objects = [];
    final limitedIds = objectIds.take(limit).toList();

    for (final id in limitedIds) {
      try {
        final objectDetail = await getObjectDetail(id);
        if (objectDetail['primaryImageSmall'] != null &&
            objectDetail['primaryImageSmall'].toString().isNotEmpty) {
          objects.add(objectDetail);
        }
      } catch (e) {
        print("Erreur pour l'objet $id: $e");

      }
    }

    return objects;
  }

  Future<Map<String, dynamic>> getObjectDetail(int objectId) async {
    final response = await http.get(Uri.parse('$baseurl/objects/$objectId'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load object detail');
    }
  }
}
