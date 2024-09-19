import 'package:flutter/material.dart';
import 'package:flutter_ecoscore/shared/theme.dart';

class BeritaStyle3 extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'image': 'assets/images/beritasehat1.png',
      'title': 'Diabest friend,ayo cek kesehatan saraf mu sekarang',
      'subtitle': 'subtitle 1',
    },
    {
      'image': 'assets/images/beritasehat2.png',
      'title': 'apakah sereal Sehat untuk orang diabetes',
      'subtitle': 'Subtitle 2',
    },

    // Add more items here
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 232,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            width: 300,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    item['image']!,
                    width: 300,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item['title']!,
                      style: regularTextStyle.copyWith(fontSize: 16.0,
                        fontWeight: FontWeight.bold)
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
