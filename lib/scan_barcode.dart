import 'package:flutter/material.dart';
import 'package:flutter_ecoscore/shared/theme.dart';
import 'package:flutter_ecoscore/user_review1.dart';
import 'package:flutter_ecoscore/widget/buttonsheetproduct.dart';

class ScanBarcodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/scan_barcode.png', // Ganti dengan path ke gambar yang sesuai
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/beranda');
              },
            ),
          ),
          Positioned(
            top: 40,
            right: 16,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.crop_free, color: Colors.white),
                  onPressed: () {
                    // Aksi untuk memindai
                  },
                ),
                IconButton(
                  icon: Icon(Icons.image, color: Colors.white),
                  onPressed: () {
                    // Aksi untuk melihat gambar
                  },
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 16,
            right: 16,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return ProductBottomSheet();
                        },
                      );
                    },
                    child: Text(
                      'Pop Corners White Cheddar',
                      style: blackTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '140 Calories',
                        style: greyTextStyle.copyWith(fontWeight: FontWeight.bold,
                        fontSize: 16),
                      ),
                      SizedBox(width: 16),
                      GestureDetector(
                        onTap: () {
                          // Navigasi ke halaman review
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UserReviewPage())
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.grey,),
                            SizedBox(width: 4),
                            Text(
                              '4.2',
                              style: greyTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
