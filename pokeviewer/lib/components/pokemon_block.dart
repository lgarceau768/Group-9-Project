import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokeviewer/components/Pkm.dart';


class Pokemon extends StatelessWidget {
  final String name;
  final PKM jsonData;
  final String number;
  const Pokemon({Key key, this.name, this.number, this.jsonData}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var realNum;
    switch (number.length) {
      case 1:
        realNum = '00' + number; 
        break;
      case 2:
        realNum = '0' + number;
        break;
      case 3:
        realNum = number;
        break;
      default:
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.deepPurple[200],
        boxShadow: [
          BoxShadow(color: Colors.grey[800], offset: Offset(2, 4), blurRadius: 5)
        ]
      ),
      child: InkWell(
        onTap: () {
         Navigator.pushNamed(context, '/details', arguments: jsonData);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network('https://www.pokencyclopedia.info/sprites/gen5/ani_black-white/ani_bw_'+realNum+'.gif', width: 80, height: 80),
            Text(name, style: TextStyle(
              fontFamily: 'Eras ITC',
              fontSize: 15,
              color: Colors.white
            ),
            textAlign: TextAlign.center,
            )
          ]
        )
      )
    );
          
  }
}