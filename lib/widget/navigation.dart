import 'package:flutter_ecoscore/scan_barcode.dart';
import 'package:flutter_ecoscore/screen/Beranda.dart';
import 'package:flutter_ecoscore/screen/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  static const String routename = "/Navigation-menu";
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int index = 0;
  final screens = [
    BerandaScreen(),
    ScanBarcodePage(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorColor: Color.fromARGB(255, 91, 219, 81),
        elevation: 0,
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() => this.index = index),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',

          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.barcode),
            label: 'Scan',
          ),
          NavigationDestination(
            icon: Icon(Icons.people),
            label: 'Profile',
          ),
        ],
      ),
      body: screens[index],
    );
  }
}
