import 'package:flutter/material.dart';
import 'package:flutter_ecoscore/shared/theme.dart';

class BackroundScanScrenn extends StatelessWidget {
  const BackroundScanScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 180.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/backroundscan.jpg'),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Good Morning',
                  textAlign: TextAlign.center,
                  style: regularTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
              Text('Novaria Nita',
                  textAlign: TextAlign.center,
                  style: regularTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
            ],
          ),
        )
      ],
    );
  }
}
