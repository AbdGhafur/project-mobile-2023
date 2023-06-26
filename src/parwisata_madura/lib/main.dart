import 'package:flutter/material.dart';
import 'package:uas_wisata_madura/page/login_page.dart';
import 'package:uas_wisata_madura/page/signup_page.dart';
import 'package:uas_wisata_madura/screens/category_screen.dart';

import './screens/detail_screen.dart';
import './screens/places_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Pariwisata',
      theme: ThemeData(
          primaryColor: Colors.pinkAccent,
          accentColor: Colors.pink,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                titleMedium:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                titleLarge: TextStyle(fontWeight: FontWeight.bold),
              )),
      routes: {
        '/': (ctx) => LoginPage(),
        '/places': (ctx) => PlacesScreen(),
        '/detail': (ctx) => DetailScreen(),
        '/signup': (ctx) => SignupPage(),
        '/login': (ctx) => LoginPage(),
        '/category': (ctx) => CategoryScreen(),
        '/tab': (ctx) => CategoryScreen(),
      },
    );
  }
}
