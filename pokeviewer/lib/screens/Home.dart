import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokeviewer/components/bkg.dart';
import 'package:pokeviewer/components/heading.dart';
import 'package:pokeviewer/components/loading.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: InkWell(
        onTap: () => Navigator.popAndPushNamed(context, '/search'),
        child: BKG(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Heading(text: 'Loading'),
              InkWell(
                onTap: () => Navigator.popAndPushNamed(context, '/search'),
                child: LoadingBall()
              )
            ]
          )
        )
      ),
    );
  }
}