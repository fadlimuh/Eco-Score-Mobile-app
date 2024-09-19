import 'package:flutter/material.dart';
import 'package:flutter_ecoscore/shared/theme.dart';

class ScanHistoryScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      imageUrl: 'assets/images/popcorners.png',
      name: 'Pop Corners White Cheddar',
      details: [
        'Case of 12 5-ounce bags',
        'All natural popped corn chips',
        'Popped, made with real corn',
        'No trans fat, No cholesterol',
        'Kosher'
      ],
      rating: 4.2,
    ),
    Product(
      imageUrl: 'assets/images/gandum.png',
      name: 'gandum',
      details: [
        'Case of 12 5-ounce bags',
        'All natural popped corn chips',
        'Popped, made with real corn',
        'No trans fat, No cholesterol',
        'Kosher'
      ],
      rating: 4.2,
    ),
    // Tambahkan produk lainnya di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan History'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _showPopup(context, products[index]),
              child: ProductCard(product: products[index]),
            );
          },
        ),
      ),
    );
  }

  void _showPopup(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(product.name,
          style: regularTextStyle.copyWith(fontWeight: FontWeight.bold,
          fontSize: 20),),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                product.imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              ...product.details.map((detail) => Text(detail,
              style: regularTextStyle.copyWith(fontSize: 16),)).toList(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 20),
                  Text(
                    '${product.rating}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class Product {
  final String imageUrl;
  final String name;
  final List<String> details;
  final double rating;

  Product({
    required this.imageUrl,
    required this.name,
    required this.details,
    required this.rating,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                product.imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: regularTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  ...product.details.map((detail) => Text(detail,
                  style: regularTextStyle.copyWith(fontSize: 16),)).toList(),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 20),
                      Text(
                        '${product.rating}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
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