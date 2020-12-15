import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class LoadingBox extends StatelessWidget {
  const LoadingBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SkeletonAnimation(
        child: Container(
          width: 110,
          height: 122,
          decoration: BoxDecoration(
            color: Color(0xffe5e5e5).withOpacity(0.9),
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
        ),
        )
    );
  }
}