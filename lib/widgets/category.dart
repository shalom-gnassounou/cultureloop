import 'package:flutter/material.dart';
import 'category_item.dart';

class CategorySection extends StatelessWidget {
  //final VoidCallback? onTap;
  const CategorySection({super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        CategoryItem(
          title: 'African Art',
          imagePath: 'assets/images/photos/AfricanArt.jpg',
          iconPath: 'assets/images/pictos/africain.png',
          onTap: () {
            Navigator.pushNamed(context, '/africa');

          },
        ),
        CategoryItem(
          title: 'Asian Art',
          imagePath: 'assets/images/photos/AsianArt.jpg',
          iconPath: 'assets/images/pictos/asie_yingyang.png',
        ),
        CategoryItem(
          title: 'Egyptian Art',
          imagePath: 'assets/images/photos/EgyptianArt.jpg',
          iconPath: 'assets/images/pictos/egyptian.png',
        ),
        CategoryItem(
          title: 'European Paintings',
          imagePath: 'assets/images/photos/EuropeanPaintings.jpg',
          iconPath: 'assets/images/pictos/joconde.png',
        ),
        CategoryItem(
          title: 'Islamic Art',
          imagePath: 'assets/images/photos/IslamicArt.jpg',
          iconPath: 'assets/images/pictos/islam.png',
        ),
        CategoryItem(
          title: 'Greek and Roman Art',
          imagePath: 'assets/images/photos/GreekandRomanArt.jpg',
          iconPath: 'assets/images/pictos/grec.png',
        ),
      ],
    );
  }
}
