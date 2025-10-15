import 'package:flutter/material.dart';

import 'itinerary_modal.dart';

class ItineraryCard {
  final String name;
  final String date;
  final String imageUrl;
  final String departement;

  ItineraryCard({
    required this.name,
    required this.date,
    required this.imageUrl,
    required this.departement,
  });

  Widget buildDisplay({bool showMoreButton = false}) {
    return ItineraryDisplay(
      itineraryCard: this,
      showMoreButton: showMoreButton,
    );
  }
}

class ItineraryDisplay extends StatelessWidget {
  final ItineraryCard itineraryCard;
  final bool showMoreButton;

  const ItineraryDisplay({
    super.key,
    required this.itineraryCard,
    this.showMoreButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFF6F3ED),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(itineraryCard.imageUrl, fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itineraryCard.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFC6A169),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  itineraryCard.departement,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFC6A169),
                  ),
                ),
                SizedBox(height: 4),
              ],
            ),
          ),
          if (showMoreButton) ...[
            SizedBox(width: 8),
            IconButton(
              icon: Icon(Icons.more_vert, color: Colors.black54),
              onPressed: () {
                showItineraryModal(context, itineraryCard);
              },
            ),
          ],
        ],
      ),
    );
  }
}
