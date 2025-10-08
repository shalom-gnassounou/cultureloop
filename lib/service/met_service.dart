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
  Future<List<dynamic>> getObjectsByDepartment(int departmentId) async {
    final response = await http.get(Uri.parse('$baseurl/objects?departmentIds=$departmentId'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['objectIDs'];
    } else {
      throw Exception('Failed to load objects');
    }
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
