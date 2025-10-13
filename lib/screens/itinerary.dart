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
    // Liste temporaire, il faut la remplacer par notre api
    final List<ItineraryCard> itineraryCards = List.generate(
      10,
      (index) => ItineraryCard(
        name: 'Kiyohara Yukinobu',
        department: 'Asian Art',
        imageUrl: 'assets/images/photos/AfricanArt.jpg',
      ),
    );
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
                    SizedBox(height: 4),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: itineraryCards.length,
                      itemBuilder: (context, index) {
                        return ItineraryItem(
                          itineraryCard: itineraryCards[index],
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
