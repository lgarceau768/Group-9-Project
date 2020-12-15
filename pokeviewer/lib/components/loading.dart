import 'package:flutter/material.dart';

class LoadingBall extends StatelessWidget {
  const LoadingBall({Key key}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/loading.gif');
  }
}