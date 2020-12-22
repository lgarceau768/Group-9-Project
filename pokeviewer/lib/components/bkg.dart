import 'package:flutter/material.dart';

class BKG extends StatelessWidget {
  final Widget child;
  const BKG({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF84FFC9),
            Color(0xffAAB2FF),
            Color(0xFFECA0FF)
          ]
        )
      ),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: child
      ),
    );
  }
}