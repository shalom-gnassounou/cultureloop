import 'package:flutter/material.dart';

class VueDetail extends StatelessWidget {
  const VueDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Text(
            "Quail and Millet",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 20),
          Image.asset(
            "assets/images/photos/QuaiAndMillet.jpeg",
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "creditLine: The Howard Mansfield Collection, Purchase, Rogers Fund, 1936",
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
          SizedBox(height: 16),
          Divider(thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.favorite_border, size: 30),
              Icon(Icons.photo_camera, size: 30),
              Icon(Icons.border_color, size: 30),
              Icon(Icons.download, size: 30),
            ],
          ),
          Divider(thickness: 1),
          SizedBox(height: 16),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "department: Asian Art",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Kiyohara Yukinobu",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w800,
                color: Color(0xFFC6A169),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "artistDisplayBio: Japanese, 1643–1682",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "classification: Paintings",
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "accessionYear: 1936",
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "medium: Hanging scroll; ink and color on silk,",
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "dimensions: 46 5/8 x 18 3/4 in. (118.4 x 47.6 cm)",
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "period : Edo period (1615–1868)",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 36),
                Row(
                  children: [
                    Text(
                      "Paint",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.border_color, size: 24),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 500,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.edit, size: 30, color: Colors.black),
                            Icon(Icons.edit, size: 30, color: Colors.red),
                            Icon(Icons.edit, size: 30, color: Colors.blue),
                            Icon(Icons.edit, size: 30, color: Colors.green),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
