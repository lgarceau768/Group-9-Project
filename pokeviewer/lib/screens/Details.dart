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

  List<List<Widget>> getTypeAdvantage(List<String> types){
    List<Widget> weaknesses = [];
    List<Widget> advantages = [];

    var type1 = types[0].toLowerCase();
    var type2 = types[1].toLowerCase();
    if(type1 == 'normal'){
      weaknesses.add(Type(type: 'rock'));
      weaknesses.add(Type(type: 'ghost'));
      weaknesses.add(Type(type: 'steel'));
    } else if(type1 == 'fighting'){
      weaknesses.add(Type(type: 'posion'));
      weaknesses.add(Type(type: 'flying'));
      weaknesses.add(Type(type: 'bug'));
      weaknesses.add(Type(type: 'ghost'));
      weaknesses.add(Type(type: 'fighting'));
      advantages.add(Type(type: 'rock'));
      advantages.add(Type(type: 'steel'));
      advantages.add(Type(type: 'ice'));
      advantages.add(Type(type: 'dark'));
      advantages.add(Type(type: 'normal'));
    } else if(type1 == 'flying'){
      advantages.addAll([Type(type: 'rock'), Type(type: 'steel'), Type(type: 'ice'), Type(type: 'dark'), Type(type: 'normal')]);
      weaknesses.addAll([Type(type: 'electric'), Type(type: 'rock'), Type(type: 'steel')]);
    } else if(type1 == 'posion'){
      advantages.addAll([Type(type: 'grass'), Type(type: 'fairy')]);
      weaknesses.addAll([Type(type: 'ghost'), Type(type: 'steel'), Type(type: 'rock'), Type(type: 'ground'), Type(type: 'poison')]);
    } else if(type1 == 'ground'){
      advantages.addAll([Type(type: 'poison'), Type(type: 'rock'), Type(type: 'steel'), Type(type: 'fire'), Type(type: 'electric')]);
      weaknesses.addAll([Type(type: 'flying'), Type(type: 'grass'), Type(type: 'bug')]);
    } else if(type1 == 'rock'){
      advantages.addAll([Type(type: 'flying'), Type(type: 'bug'), Type(type: 'fire'), Type(type: 'ice')]);
      weaknesses.addAll([Type(type: 'flying'), Type(type: 'ground'), Type(type: 'steel')]);
    } else if(type1 == 'bug'){
      advantages.addAll([Type(type: 'psyhic'), Type(type: 'dark'), Type(type: 'grass')]);
      weaknesses.addAll([Type(type: 'fighting'), Type(type: 'ghost'), Type(type: 'steel'), Type(type: 'fairy'), Type(type: 'fire'), Type(type: 'poison'), Type(type: 'flying')]);
    } else if(type1 == 'ghost'){
      advantages.addAll([Type(type: 'ghost'), Type(type: 'psychic')]);
      weaknesses.addAll([Type(type: 'normal'), Type(type: 'dark')]);
    } else if(type1 == 'steel'){
      advantages.addAll([Type(type: 'fairy'), Type(type: 'ice'), Type(type: 'rock')]);
      weaknesses.addAll([Type(type: 'electric'), Type(type: 'water'), Type(type: 'fire'), Type(type: 'steel')]);
    } else if(type1 == 'fire'){
      advantages.addAll([Type(type: 'grass'), Type(type: 'bug'), Type(type: 'steel'), Type(type: 'ice')]);
      weaknesses.addAll([Type(type: 'water'), Type(type: 'dragon'), Type(type: 'rock')]);
    } else if(type1 == 'water'){
      advantages.addAll([Type(type: 'ground'),Type(type: 'rock'), Type(type: 'rock')]);
      weaknesses.addAll([Type(type: 'electric'), Type(type: 'grass'), Type(type: 'dragon')]);
    } else if(type1 == 'grass'){
      advantages.addAll([Type(type: 'ground'), Type(type: 'rock'), Type(type: 'fire')]);
      weaknesses.addAll([Type(type: 'flying'), Type(type: 'posion'), Type(type: 'bug'), Type(type: 'fire'), Type(type: 'steel'), Type(type: 'dragon')]);
    } else if(type1 == 'electric'){
      advantages.addAll([Type(type: 'flying'), Type(type: 'water')]);
      weaknesses.addAll([Type(type: 'ground'), Type(type: 'grass'), Type(type: 'dragon')]);
    } else if(type1 == 'psychic'){
      advantages.addAll([Type(type: 'fighting'), Type(type: 'poison')]);
      weaknesses.addAll([Type(type: 'steel'), Type(type: 'psychic'), Type(type: 'dark')]);
    } else if(type1 == 'ice'){
      advantages.addAll([Type(type: 'flying'), Type(type: 'ground'), Type(type: 'dragon'), Type(type: 'grass')]);
      weaknesses.addAll([Type(type: 'fire'), Type(type: 'steel'), Type(type: 'water')]);
    } else if(type1 == 'dragon'){
      advantages.addAll([Type(type: 'dragon')]);
      weaknesses.addAll([Type(type: 'dragon'), Type(type: 'fairy'), Type(type: 'steel')]);
    } else if(type1 == 'fairy'){
      advantages.addAll([Type(type: 'fighting'), Type(type: 'dragon'), Type(type: 'dark')]);
      weaknesses.addAll([Type(type: 'steel'), Type(type: 'poison'), Type(type: 'fire')]);
    } else if(type1 == 'dark'){
      advantages.addAll([Type(type: 'ghost'), Type(type: 'psychic')]);
      weaknesses.addAll([Type(type: 'fighting'), Type(type: 'dark'), Type(type: 'fairy')]);
    }

    if(type2 == 'normal'){
      weaknesses.add(Type(type: 'rock'));
      weaknesses.add(Type(type: 'ghost'));
      weaknesses.add(Type(type: 'steel'));
    } else if(type2 == 'fighting'){
      weaknesses.add(Type(type: 'posion'));
      weaknesses.add(Type(type: 'flying'));
      weaknesses.add(Type(type: 'bug'));
      weaknesses.add(Type(type: 'ghost'));
      weaknesses.add(Type(type: 'fighting'));
      advantages.add(Type(type: 'rock'));
      advantages.add(Type(type: 'steel'));
      advantages.add(Type(type: 'ice'));
      advantages.add(Type(type: 'dark'));
      advantages.add(Type(type: 'normal'));
    } else if(type2 == 'flying'){
      advantages.addAll([Type(type: 'rock'), Type(type: 'steel'), Type(type: 'ice'), Type(type: 'dark'), Type(type: 'normal')]);
      weaknesses.addAll([Type(type: 'electric'), Type(type: 'rock'), Type(type: 'steel')]);
    } else if(type2 == 'posion'){
      advantages.addAll([Type(type: 'grass'), Type(type: 'fairy')]);
      weaknesses.addAll([Type(type: 'ghost'), Type(type: 'steel'), Type(type: 'rock'), Type(type: 'ground'), Type(type: 'poison')]);
    } else if(type2 == 'ground'){
      advantages.addAll([Type(type: 'poison'), Type(type: 'rock'), Type(type: 'steel'), Type(type: 'fire'), Type(type: 'electric')]);
      weaknesses.addAll([Type(type: 'flying'), Type(type: 'grass'), Type(type: 'bug')]);
    } else if(type2 == 'rock'){
      advantages.addAll([Type(type: 'flying'), Type(type: 'bug'), Type(type: 'fire'), Type(type: 'ice')]);
      weaknesses.addAll([Type(type: 'flying'), Type(type: 'ground'), Type(type: 'steel')]);
    } else if(type2 == 'bug'){
      advantages.addAll([Type(type: 'psyhic'), Type(type: 'dark'), Type(type: 'grass')]);
      weaknesses.addAll([Type(type: 'fighting'), Type(type: 'ghost'), Type(type: 'steel'), Type(type: 'fairy'), Type(type: 'fire'), Type(type: 'poison'), Type(type: 'flying')]);
    } else if(type2 == 'ghost'){
      advantages.addAll([Type(type: 'ghost'), Type(type: 'psychic')]);
      weaknesses.addAll([Type(type: 'normal'), Type(type: 'dark')]);
    } else if(type2 == 'steel'){
      advantages.addAll([Type(type: 'fairy'), Type(type: 'ice'), Type(type: 'rock')]);
      weaknesses.addAll([Type(type: 'electric'), Type(type: 'water'), Type(type: 'fire'), Type(type: 'steel')]);
    } else if(type2 == 'fire'){
      advantages.addAll([Type(type: 'grass'), Type(type: 'bug'), Type(type: 'steel'), Type(type: 'ice')]);
      weaknesses.addAll([Type(type: 'water'), Type(type: 'dragon'), Type(type: 'rock')]);
    } else if(type2 == 'water'){
      advantages.addAll([Type(type: 'ground'),Type(type: 'rock'), Type(type: 'rock')]);
      weaknesses.addAll([Type(type: 'electric'), Type(type: 'grass'), Type(type: 'dragon')]);
    } else if(type2 == 'grass'){
      advantages.addAll([Type(type: 'ground'), Type(type: 'rock'), Type(type: 'fire')]);
      weaknesses.addAll([Type(type: 'flying'), Type(type: 'posion'), Type(type: 'bug'), Type(type: 'fire'), Type(type: 'steel'), Type(type: 'dragon')]);
    } else if(type2 == 'electric'){
      advantages.addAll([Type(type: 'flying'), Type(type: 'water')]);
      weaknesses.addAll([Type(type: 'ground'), Type(type: 'grass'), Type(type: 'dragon')]);
    } else if(type2 == 'psychic'){
      advantages.addAll([Type(type: 'fighting'), Type(type: 'poison')]);
      weaknesses.addAll([Type(type: 'steel'), Type(type: 'psychic'), Type(type: 'dark')]);
    } else if(type2 == 'ice'){
      advantages.addAll([Type(type: 'flying'), Type(type: 'ground'), Type(type: 'dragon'), Type(type: 'grass')]);
      weaknesses.addAll([Type(type: 'fire'), Type(type: 'steel'), Type(type: 'water')]);
    } else if(type2 == 'dragon'){
      advantages.addAll([Type(type: 'dragon')]);
      weaknesses.addAll([Type(type: 'dragon'), Type(type: 'fairy'), Type(type: 'steel')]);
    } else if(type2 == 'fairy'){
      advantages.addAll([Type(type: 'fighting'), Type(type: 'dragon'), Type(type: 'dark')]);
      weaknesses.addAll([Type(type: 'steel'), Type(type: 'poison'), Type(type: 'fire')]);
    } else if(type2 == 'dark'){
      advantages.addAll([Type(type: 'ghost'), Type(type: 'psychic')]);
      weaknesses.addAll([Type(type: 'fighting'), Type(type: 'dark'), Type(type: 'fairy')]);
    }
    // remove duplicates
    List<List<Widget>> returnVal = [List<Widget>(), List<Widget>()];
    for (var item in advantages) {
      if(returnVal[0].contains(item)){
        continue;
      } else {
        returnVal[0].add(item);
      }
    }
    for (var item in weaknesses) {
      if(returnVal[1].contains(item)){
        continue;
      } else {
        returnVal[1].add(item);
      }
    }
    return returnVal;
  }

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
        colorFn: (PKM_Series series, _) => charts.ColorUtil.fromDartColor(series.barCol),
      )
    ];

    Widget typeChart = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Color(0xff7381B5).withOpacity(0.8),
        boxShadow: [
          BoxShadow(color: Colors.black, offset: Offset(0, 3), blurRadius: 3)
        ]
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Para(text: 'Advantage'),
                Para(text: 'Weakness')
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: getTypeAdvantage([args.type_1, args.type_2])[0],
                ),
                VerticalDivider(color: Colors.grey[300], thickness: 2, width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: getTypeAdvantage([args.type_1, args.type_2])[1],
                )
                
              ],
            )
          ]
        )
      )
    );

    return Scaffold(
      appBar: null,
      body: BKG(
        child: SingleChildScrollView(
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
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: typeChart
              )
            ],
          )
        )
      )
    );
  }
}