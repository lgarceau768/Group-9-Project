import 'package:flutter/material.dart';

class Para extends StatelessWidget {
  final String text;
  const Para({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Eras ITC',
        fontSize: 14,
      )
    );
  }
}