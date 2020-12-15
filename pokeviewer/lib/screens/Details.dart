import 'package:flutter/material.dart';
import 'package:pokeviewer/components/Para.dart';
import 'package:pokeviewer/components/Pkm.dart';
import 'package:pokeviewer/components/Txt.dart';
import 'package:pokeviewer/components/bkg.dart';
import 'package:pokeviewer/components/chart.dart';
import 'package:pokeviewer/components/series.dart';
import 'package:pokeviewer/components/type.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DetailsScreen extends StatefulWidget {
  String jsonData;
  DetailsScreen({Key key, this.jsonData}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final PKM args = ModalRoute.of(context).settings.arguments;

    var realNum;
    switch (args.number.length) {
      case 1:
        realNum = '00' + args.number; 
        break;
      case 2:
        realNum = '0' + args.number;
        break;
      case 3:
        realNum = args.number;
        break;
      default:
    }
    // make data for graph
    List<PKM_Series> data = [
      PKM_Series('Tot', args.total),
      PKM_Series('HP', args.hp),
      PKM_Series('Atk', args.attack),
      PKM_Series('Def', args.defense),
      PKM_Series('Sp_Atk', args.sp_atk),
      PKM_Series('Sp_Def', args.sp_def),
      PKM_Series('Spd', args.speed)      
    ];

    List<charts.Series<PKM_Series, String>> seriesList = [
      charts.Series(
        id: 'PKM Stats',
        data: data,
        domainFn: (PKM_Series series, _) => series.column,
        measureFn: (PKM_Series series, _) => series.value,
        labelAccessorFn: (PKM_Series series, _) => series.value.toString(),
        colorFn: (PKM_Series series, _) => charts.ColorUtil.fromDartColor(series.barCol)
      )
    ];

    return Scaffold(
      appBar: null,
      body: BKG(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children:[                
                Image.network('https://www.pokencyclopedia.info/sprites/gen5/ani_black-white/ani_bw_'+realNum+'.gif', width: 300, height: 300, scale: 0.25),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back_ios, size: 35, color: Color(0xff68d999)),
                      ),
                      args.type_2 == '' ? 
                      Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Type(type: args.type_1)
                      ): 
                      Column(children: [Type(type: args.type_1), Type(type:args.type_2)])
                    ]
                  )
                ),
              ],
            ),
            Txt(text: args.name),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Color(0xff7381B5).withOpacity(0.8),
                boxShadow: [
                  BoxShadow(color: Colors.black, offset: Offset(0, 3), blurRadius: 3)
                ]
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, left: 2),
                      child: Para(text: 'Stats:')
                    )
                  ),
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: VerticalBarLabelChart(seriesList)
                  )
                ],
              )
            )
          ],
        )
      )
    );
  }
}