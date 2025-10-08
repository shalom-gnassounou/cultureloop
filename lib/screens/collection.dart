import 'package:cultureloop/widgets/collection_page.dart';
import 'package:cultureloop/widgets/header_section.dart';
import 'package:cultureloop/widgets/navigation_bar_app.dart';
import 'package:flutter/material.dart';

class CollectionScreen extends StatelessWidget {
  final int departmentId;
  final String title;

  const CollectionScreen({
    super.key,
    required this.departmentId,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderSection(),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
              hintText: "Rechercher une œuvre...",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white70,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: CollectionPage(departmentId: departmentId, title: title, ),
          ),

        ],
      ),
      bottomNavigationBar: NavigationBarApp()
    );
  }
}
