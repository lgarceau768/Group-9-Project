import 'package:flutter/material.dart';
import 'package:pokeviewer/components/Para.dart';
import 'package:pokeviewer/components/Txt.dart';
import 'package:pokeviewer/components/bkg.dart';
import 'package:pokeviewer/components/heading.dart';

class Tutorial extends StatefulWidget {
  Tutorial({Key key}) : super(key: key);

  @override
  _TutorialState createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: BKG(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Heading(text: 'Welcome to PokeViewer!'),
            Image.asset('assets/ball.png', width: 200, height: 200),
            Para(text: 'Our group designed and developed an application called Pokeviewer. Players and speed runners are often looking for the best strategies to get past challenges in Pokemon games. To do this they might want to see the stats of various Pokemon to fight more effectively. Our application gives these users an easy way to find the stats of these Pokemon as well as well as giving their strengths and weaknesses'),
            InkWell(
              onTap: () => Navigator.popAndPushNamed(context, '/home'),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purpleAccent[100],
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  boxShadow: [BoxShadow(color: Colors.grey[300], blurRadius: 3.0)]
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Txt(text: 'Start Searching!')
                )
              )
            ),
            Para(text: 'This is a school project, this is no way affiliated with the Pokemon Corporation, and is not for commercial use')
          ],
        )
      )
    );
  }
}