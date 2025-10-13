import 'package:flutter/material.dart';
import 'itinerary_card.dart';

class ItineraryItem extends StatelessWidget {
  final ItineraryCard itineraryCard;

  const ItineraryItem({super.key, required this.itineraryCard});

  @override
  Widget build(BuildContext context) {
    return itineraryCard.buildDisplay(showMoreButton: true);
  }
}
