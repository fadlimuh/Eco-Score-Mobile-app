import 'package:flutter/material.dart';
import 'package:flutter_ecoscore/shared/theme.dart';

class BeritaStyle extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'image': 'assets/images/beritalifestyle1.png',
      'title': 'Mengatur Jam Makan ,Penting Untuk bantu Kendalikan gula darah',
      'subtitle': '',
    },
    {
      'image': 'assets/images/beritalifestyle2.png',
      'title': 'Manfaat Berhenti Merokok,Orang Diabetes Harus Tau',
      'subtitle': '',
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
                    child: Text(item['title']!,
                        style: regularTextStyle.copyWith(fontSize: 14,fontWeight: FontWeight.bold)),
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
