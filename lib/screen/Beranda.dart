import 'package:flutter_ecoscore/shared/theme.dart';
import 'package:flutter_ecoscore/widget/backround_Scan.dart';
import 'package:flutter_ecoscore/widget/berita3.dart';
import 'package:flutter_ecoscore/widget/berita_Widget.dart';
import 'package:flutter_ecoscore/widget/berita_style.dart';
import 'package:flutter_ecoscore/widget/category_product_widget.dart';
import 'package:flutter_ecoscore/widget/searc_widget.dart';

import 'package:flutter/material.dart';

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({super.key});

  @override
  State<BerandaScreen> createState() => _ScanScrennState();
}

class _ScanScrennState extends State<BerandaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackroundScanScrenn(),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchTabWdiget(),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Recent Scanned Product",
                        style: regularTextStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    SizedBox(
                      height: 30,
                    ),
                    CategoryProduct(),
                    SizedBox(
                      height: 30,
                    ),
                    Text("What's New",
                        style: regularTextStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 26)),
                    SizedBox(
                      height: 10,
                    ),
                    BeritaUtama(),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Lifestyle",
                        style: regularTextStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 26)),
                    SizedBox(
                      height: 10,
                    ),
                    BeritaStyle(),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Insights',
                      style: regularTextStyle.copyWith(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BeritaStyle3(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
