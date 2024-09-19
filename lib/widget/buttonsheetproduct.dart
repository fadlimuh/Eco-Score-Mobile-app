import 'package:flutter/material.dart';
import 'package:flutter_ecoscore/shared/theme.dart';

class ProductBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductHeader(),
          Divider(),
          PositiveNegativeTabs(),
        ],
      ),
    );
  }
}

class ProductHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/popcorners.png', // Replace with actual image asset path
                height: 100,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pop Corners White Cheddar',
                      style: regularTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Case of 12 5-ounce bags',
                      style: regularTextStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'All natural popped corn chips',
                      style: regularTextStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Popped, made with real corn',
                      style: regularTextStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'No trans fat, No cholesterol',
                      style: regularTextStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Kosher',
                      style: regularTextStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        Text('4.2 (5 Review)'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PositiveNegativeTabs extends StatefulWidget {
  @override
  _PositiveNegativeTabsState createState() => _PositiveNegativeTabsState();
}

class _PositiveNegativeTabsState extends State<PositiveNegativeTabs> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => setState(() => _selectedIndex = 0),
              child: Text(
                'Positive',
                style: regularTextStyle.copyWith(fontWeight: _selectedIndex == 0 ? FontWeight.bold : FontWeight.normal)
              ),
            ),
            GestureDetector(
              onTap: () => setState(() => _selectedIndex = 1),
              child: Text(
                'Negative',
                style: regularTextStyle.copyWith(fontWeight: _selectedIndex == 1 ? FontWeight.bold : FontWeight.normal)
              ),
            ),
          ],
        ),
        Divider(),
        if (_selectedIndex == 0) PositiveList() else NegativeList(),
      ],
    );
  }
}

class PositiveList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PositiveItem('Protein: 4/5'),
        PositiveItem('Energy: 6/10'),
        PositiveItem('Sugars in low quantity (3.75%)'),
        PositiveItem('Video Review'),
      ],
    );
  }
}

class PositiveItem extends StatelessWidget {
  final String text;

  PositiveItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check_circle, color: Colors.green),
        SizedBox(width: 8),
        Text(text,
        style: regularTextStyle,),
      ],
    );
  }
}

class NegativeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NegativeItem('Disodium guanylate'),
        NegativeItem('Citric Acid'),
        NegativeItem('Fat in high quantity (28.6%)'),
        NegativeItem('Monosodium glutamate'),
        NegativeItem('Salt in high quantity (1.61%)'),
      ],
    );
  }
}

class NegativeItem extends StatelessWidget {
  final String text;

  NegativeItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.cancel, color: Colors.red),
        SizedBox(width: 8),
        Text(text,
        style: regularTextStyle,),
      ],
    );
  }
}