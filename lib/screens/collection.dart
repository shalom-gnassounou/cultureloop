import 'package:cultureloop/widgets/header_section.dart';
import '../widgets/navigation_bar_app.dart';
import 'package:flutter/material.dart';

class Africa extends StatelessWidget {
  const Africa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              HeaderSection(
              ),
               SizedBox(height:20,),
               const Text("Collection African Art",style: TextStyle(
                 fontSize: 17,
                 fontWeight: FontWeight.w500,
                 color: Colors.black87,
               ),),
               SizedBox(height: 30),
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
              SizedBox(height: 40),
              Center(
                child: Text(
                  "Découvrez les œuvres de la collection Art d’Afrique",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, '/detail');
                      },
                      leading: Image.asset(
                        "assets/images/photos/AfricanArt.jpg",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      title: Text("Œuvre ${index + 1}"),
                      subtitle: const Text("Artiste inconnu"),
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBarApp(),
    );
  }
}
