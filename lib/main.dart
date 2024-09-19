import 'package:flutter/material.dart';
import 'package:flutter_ecoscore/diet1.dart';
import 'package:flutter_ecoscore/explore_page.dart';
import 'package:flutter_ecoscore/firstpage.dart';
import 'package:flutter_ecoscore/screen/Beranda.dart';
import 'package:flutter_ecoscore/sign_in.dart';
import 'package:flutter_ecoscore/sign_up.dart';
import 'package:flutter_ecoscore/splashscreen.dart';
import 'package:flutter_ecoscore/widget/navigation.dart'; // Assuming this is the correct path

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecoscore',
      theme: ThemeData(
        primaryColor: Colors.black,
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => SplashScreen(),
        // '/admin/products': (context) => ProductsPage(),
        // 'admin/artikel': (context) => ArticlesPage(),
        '/firstpage': (context) => FirstPage(),        
        '/sign-up': (context) => SignUpPage(),
        '/sign-in': (context) => SignInScreen(),
        '/diet-prefensi': (context) => DietPreferenceScreen(),
        '/beranda': (context) => NavigationMenu(),
      },
    );
  }
}
