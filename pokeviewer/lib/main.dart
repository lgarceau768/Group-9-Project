import 'package:flutter/material.dart';
import 'package:pokeviewer/screens/Details.dart';
import 'package:pokeviewer/screens/Home.dart';
import 'package:pokeviewer/screens/Search.dart';
import 'package:pokeviewer/screens/Tutorial.dart';

void main() {
  runApp(PokeViewer());
}

class PokeViewer extends StatelessWidget {
  const PokeViewer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => HomeScreen(),
        '/': (context) => Tutorial(),
        '/search': (context) => SearchScreen(),
        '/details': (context) => DetailsScreen()
      },
      initialRoute: '/',
    );
  }
}
