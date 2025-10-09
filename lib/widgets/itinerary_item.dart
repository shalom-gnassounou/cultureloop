import 'package:flutter/material.dart';
import 'itinerary_card.dart';

class ItineraryItem extends StatelessWidget {
  final ItineraryCard itineraryCard;

  const ItineraryItem({super.key, required this.itineraryCard});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Color(0xFFF6F3ED)),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(color: Colors.grey[200]),
            child: Image.asset(itineraryCard.imageUrl, fit: BoxFit.cover),
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
                  overflow: TextOverflow
                      .ellipsis, // si ton texte est trop long, il y aura des …
                  maxLines: 1, // on le met sur une une ligne maxi
                ),
                SizedBox(height: 4),
                Text(
                  'department: ${itineraryCard.department}',
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.more_vert, color: Colors.black54),
        ],
      ),
    );
  }
}
