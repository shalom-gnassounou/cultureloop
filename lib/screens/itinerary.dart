import 'package:cultureloop/controller/parcour_controller.dart';
import 'package:cultureloop/service/model/art_work.dart';
import 'package:cultureloop/widgets/category.dart';
import 'package:cultureloop/widgets/header_section.dart';
import 'package:cultureloop/widgets/itinerary_item.dart';
import 'package:cultureloop/widgets/itinerary_card.dart';
import 'package:flutter/material.dart';
import '../widgets/navigation_bar_app.dart';



class Itinerary extends StatelessWidget {
  const Itinerary({super.key});

  @override
  Widget build(BuildContext context) {

    final ParcoursController parcoursController = ParcoursController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderSection(),
            Container(
              width: double.infinity,
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 200,
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 24,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFF6F3ED),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(Icons.add, size: 24),
                          ),
                          SizedBox(width: 12),
                          Flexible(
                            child: Text(
                              'Add to this playlist',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 12),
                    FutureBuilder<List<ArtWork>>(
                      future: parcoursController.getParcours(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }

                        if (snapshot.hasError) {
                          return Text('Erreur : ${snapshot.error}');
                        }

                        final itineraries = snapshot.data ?? [];

                        if (itineraries.isEmpty) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: Text(
                              'Aucun parcours enregistré pour le moment.',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          );
                        }

                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: itineraries.length,
                          itemBuilder: (context, index) {
                            final itinerary = itineraries[index];
                            final card = ItineraryCard(
                             name: itinerary.title,
                              date: itinerary.date,
                              imageUrl: itinerary.imageUrl,

                            );
                            return ItineraryItem(itineraryCard: card);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarApp(),
    );
  }
}
