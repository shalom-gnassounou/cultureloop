import 'package:cultureloop/data/departements_data.dart';
import 'package:flutter/material.dart';

import 'category_item.dart';

class CategorySection extends StatelessWidget {
  //final VoidCallback? onTap;
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryItem(
          title: 'African Art',
          imagePath: 'assets/images/photos/AfricanArt.jpg',
          iconPath: 'assets/images/pictos/africain.png',
          onTap: () {
            final departement = departements.firstWhere(
                  (d) => d.name == 'African Art',);
            Navigator.pushNamed(
              context,
              '/collection',arguments: {
              'departmentId': departement.id,
              'title': departement.name,
            },
            );
          },
        ),
        CategoryItem(
          title: 'Asian Art',
          imagePath: 'assets/images/photos/AsianArt.jpg',
          iconPath: 'assets/images/pictos/asie_yingyang.png',
          onTap: () {
            final departement = departements.firstWhere(
                  (d) => d.name == 'Asian Art',);
            Navigator.pushNamed(
              context,
              '/collection',arguments: {
              'departmentId': departement.id,
              'title': departement.name,
            },
            );
          },
        ),
        CategoryItem(
          title: 'Egyptian Art',
          imagePath: 'assets/images/photos/EgyptianArt.jpg',
          iconPath: 'assets/images/pictos/egyptian.png',
          onTap: () {
            final departement = departements.firstWhere(
                  (d) => d.name == 'Egyptian Art',);
            Navigator.pushNamed(
              context,
              '/collection',arguments: {
              'departmentId': departement.id,
              'title': departement.name,
            },
            );
          },
        ),
        CategoryItem(
          title: 'European Paintings',
          imagePath: 'assets/images/photos/EuropeanPaintings.jpg',
          iconPath: 'assets/images/pictos/joconde.png',
          onTap: () {
            final departement = departements.firstWhere(
                  (d) => d.name == 'European Paintings',);
            Navigator.pushNamed(
              context,
              '/collection',arguments: {
              'departmentId': departement.id,
              'title': departement.name,
            },
            );
          },
        ),
        CategoryItem(
          title: 'Islamic Art',
          imagePath: 'assets/images/photos/IslamicArt.jpg',
          iconPath: 'assets/images/pictos/islam.png',
          onTap: () {
            final departement = departements.firstWhere(
                  (d) => d.name == 'Islamic Art',);
            Navigator.pushNamed(
              context,
              '/collection',arguments: {
              'departmentId': departement.id,
              'title': departement.name,
            },
            );
          },
        ),
        CategoryItem(
          title: 'Greek and Roman Art',
          imagePath: 'assets/images/photos/GreekandRomanArt.jpg',
          iconPath: 'assets/images/pictos/grec.png',
          onTap: () {
            final departement = departements.firstWhere(
                  (d) => d.name == 'Greek and Roman Art',);
            Navigator.pushNamed(
              context,
              '/collection',arguments: {
              'departmentId': departement.id,
              'title': departement.name,
            },
            );
          },
        ),
      ],
    );
  }
}
