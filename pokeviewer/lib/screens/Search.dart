import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokeviewer/components/Pkm.dart';
import 'package:pokeviewer/components/bkg.dart';
import 'package:http/http.dart' as http;
import 'package:pokeviewer/components/loading_box.dart';
import 'package:pokeviewer/components/pokemon_block.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String pokemon;
  String searchError;
  String filter;
  List respVal;
  bool loading_results;
  List<Widget> results;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pokemon = '';
    filter = 'Name';
  }

  void search() {
    this.setState(() {
      loading_results = true;
    });
    var url = 'http://192.168.56.1:9000/search?column='+filter+'&query='+pokemon;
    print(url);
    http.get(url).then((response) {
      setState(() {
        loading_results = false;
        Map<String, dynamic> parsed = json.decode(response.body);
        respVal = parsed['results'];        
      });
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: BKG(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, left: 5, right: 5),
              child: Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xff7973B5).withOpacity(0.7),
                  borderRadius: BorderRadius.all(Radius.circular(23))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 3),
                      child: InkWell(
                        onTap: () {
                          search();
                        },
                        child: Icon(Icons.search, size: 35, color: Color(0xff68D999)),
                      
                    )),
                    Flexible(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search for a Pokemon!'
                          ),
                          style: TextStyle(
                            color: Color(0xff12355B),
                            fontFamily: 'Eras ITC',
                            fontSize: 18,
                          ),
                          onChanged: (val) {
                            this.setState(() {
                              pokemon = val;
                            });
                          },
                          onSubmitted: (val) {
                            this.setState(() {
                              pokemon = val;
                            });
                            search();
                          },
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3,right: 10),
                      child: InkWell(
                        onTap: () {
                          print("filter");
                        },
                        child: Icon(Icons.filter_list_alt, size: 35, color: Color(0xff68D999)),
                      )
                    ),
                  ],
                ),
              )
            ),
            loading_results != null ? Expanded(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: (MediaQuery.of(context).size.width / 127).floor(),  
                  crossAxisSpacing: 10,  
                  mainAxisSpacing: 10,  
                  children: loading_results == true ?
                  List.generate(18, (index) {
                    return LoadingBox();
                  }): List.generate(respVal.length, (index) {
                    var info = respVal[index];
                    return Pokemon(
                      jsonData: PKM(info['Name'], info['Number'].toString(), info['Type_1'], info['Type_2'], info['Total'], info['Attack'], info['Defense'], info['Sp_Atk'], info['Sp_Def'], info['Speed'], info['HP']),
                      name: info['Name'].toString(),
                      number: info['Number'].toString(),
                    );
                  })
                )
              )
            ): Container()
          ],
        )
      ),
    );
  }
}