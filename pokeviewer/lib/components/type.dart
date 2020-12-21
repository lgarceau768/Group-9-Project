import 'package:flutter/material.dart';
import 'package:pokeviewer/components/Para.dart';
import 'package:pokeviewer/components/Txt.dart';

class Type extends StatelessWidget {
  final String type;
  const Type({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color col;
    switch (type.toLowerCase()) {
      case 'bug':
        col = Color(0xffA5B51D);
        break;
      case 'dark':
        col = Color(0xff533D30);
        break;
      case 'dragon':
        col = Color(0xff7961E4);
        break;
      case 'electric':
        col = Color(0xffFBBA17);
        break;
      case 'fairy':
        col = Color(0xffF9CBF9);
        break;
      case 'fighting':
        col = Color(0xff81341D);
        break;
      case 'fire':
        col = Color(0xffEF430F);
        break;
      case 'flying':
        col = Color(0xff9AABF6);
        break;
      case 'ghost':
        col = Color(0xff6060B2);
        break;
      case 'grass':
        col = Color(0xff8ECF58);
        break;
      case 'ground':
        col = Color(0xffCBAA4F);
        break;
      case 'ice':
        col = Color(0xff8CDEFA);
        break;
      case 'normal':
        col = Color(0xffC8C3BB);
        break;
      case 'poision':
        col = Color(0xff8E4290);
        break;
      case 'psychic':
        col = Color(0xffEA447E);
        break;
      case 'rock':
        col = Color(0xffB69E54);
        break;
      case 'steel':
        col = Color(0xffB4B4C3);
        break;
      case 'water':
        col = Color(0xff3294F5);
        break;
      default:
        col = Colors.white;
    }
    return InkWell(
      onTap: () {
        Navigator.popAndPushNamed(context, '/search', arguments: type);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(35)),
          color: col.withOpacity(0.8)
        ),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Txt(text: type.toUpperCase())
        ),
      )
    );
  }
}