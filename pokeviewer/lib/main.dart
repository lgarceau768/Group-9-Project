import 'package:flutter/material.dart';
import 'package:pokeviewer/screens/Details.dart';
import 'package:pokeviewer/screens/Home.dart';
import 'package:pokeviewer/screens/Search.dart';

void main() {
  runApp(PokeViewer());
}

class PokeViewer extends StatelessWidget {
  const PokeViewer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomeScreen(),
        '/search': (context) => SearchScreen(),
        '/details': (context) => DetailsScreen()
      },
      initialRoute: '/',
    );
  }
}
