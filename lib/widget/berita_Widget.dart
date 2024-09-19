import 'package:flutter/material.dart';
import 'package:flutter_ecoscore/shared/theme.dart';

class BeritaUtama extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'image': 'assets/images/berita1.png',
      'title': 'Konsumsi Gula Berlebih, Waspadai Risikonya',
      'subtitle': 'Sehat negeriku',
    },
    {
      'image': 'assets/images/berita2.png',
      'title': 'Sehat Negeri ku',
      'subtitle': 'frisian flag',
    },
    {
      'image': 'assets/images/berita3.png',
      'title': '9 Brand Sehat yang dapat dikonsumsi',
      'subtitle': 'Hilo teen',
    },
    // Add more items here
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
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
                      style: regularTextStyle.copyWith(fontWeight: FontWeight.bold,
                      fontSize: 20)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      item['subtitle']!,
                      style : regularTextStyle.copyWith(fontSize: 16,
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
