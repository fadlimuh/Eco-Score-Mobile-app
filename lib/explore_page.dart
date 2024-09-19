import 'package:flutter/material.dart';
import 'package:flutter_ecoscore/screen/Beranda.dart';
import 'package:flutter_ecoscore/shared/theme.dart';
import 'package:flutter_ecoscore/widget/navigation.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Explore',
          style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NavigationMenu()),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 1.0),
            child: Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 16.0),
            TabBarWidget(),
            Expanded(
              child: ListView(
                children: [
                  CategorySection(
                    title: 'Snacks low in calories',
                    items: [
                      ProductItem(
                          'Pop Corners', 'assets/images/popcorners.png'),
                      ProductItem('Gandum', 'assets/images/gandum.png'),
                    ],
                  ),
                  CategorySection(
                    title: 'Highest Rating',
                    items: [
                      ProductItem('Pop Corners White Cheddar',
                          'assets/images/popcorners.png'),
                      ProductItem('Gandum', 'assets/images/gandum.png'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: TabBar(
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.black,
          tabs: [
            Tab(
                child: Text('Food',
                    style: regularTextStyle.copyWith(
                        fontWeight: FontWeight.bold))),
            Tab(
                child: Text('Drinks',
                    style: regularTextStyle.copyWith(
                        fontWeight: FontWeight.bold))),
            Tab(
                child: Text('Personal Care',
                    style: regularTextStyle.copyWith(
                        fontWeight: FontWeight.bold))),
            Tab(
                child: Text('Household',
                    style: regularTextStyle.copyWith(
                        fontWeight: FontWeight.bold))),
          ]),
    );
  }
}

class CategorySection extends StatelessWidget {
  final String title;
  final List<ProductItem> items;

  CategorySection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items,
        ),
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  final String name;
  final String imagePath;

  ProductItem(this.name, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
