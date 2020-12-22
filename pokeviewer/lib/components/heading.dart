import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String text;
  const Heading({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Color(0xff12355B),
        fontFamily: 'Eras ITC',
        fontSize: 66,
      )
    );
  }
}