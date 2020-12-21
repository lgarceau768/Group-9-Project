import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokeviewer/components/Pkm.dart';
import 'package:pokeviewer/components/bkg.dart';
import 'package:http/http.dart' as http;
import 'package:pokeviewer/components/loading_box.dart';
import 'package:pokeviewer/components/pokemon_block.dart';

class SearchScreen extends StatefulWidget {
  String filter;
  SearchScreen({Key key, this.filter}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String pokemon;
  bool searched;
  String searchError;
  String filter;
  List respVal;
  bool loading_results;
  List<Widget> results;

  Future<void> showFilterDiag() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Filter'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Container(
                width: 400,
                height: 100,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Filter by Type (i.e. fire)'
                  ),
                  style: TextStyle(
                    color: Color(0xff12355B),
                    fontFamily: 'Eras ITC',
                    fontSize: 18,
                  ),
                  onChanged: (val) {
                    var types = ['fire', 'water', 'flying', 'bug', 'dark', 'fairy', 'fighting', 'pyschic', 'ground', 'rock', 'dragon', 'electric', 'grass', 'steel', 'posion', 'flying', 'ghost', 'ice'];
                    if(types.contains(val.toLowerCase())){
                      val = val[0].toUpperCase() + val.substring(1);
                      this.setState(() {
                        filter = val;
                      });
                    }
                  },
                  onSubmitted: (val) {
                    var types = ['fire', 'water', 'flying', 'bug', 'dark', 'fairy', 'fighting', 'pyschic', 'ground', 'rock', 'dragon', 'electric', 'grass', 'steel', 'posion', 'flying', 'ghost', 'ice'];
                    if(types.contains(val.toLowerCase())){
                      val = val[0].toUpperCase() + val.substring(1);
                      this.setState(() {
                        filter = val;
                      });
                    }

                    // search with filter
                  },
                )
            ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Clear'),
            onPressed: () {
              Navigator.of(context).pop();
              this.setState(() {
                filter = 'Name';
              });
            },
          ),
          TextButton(
            child: Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
              searchFilter();
            },
          ),
        ],
      );
    },
  );
}

  void searchFilter(){
    this.setState(() {
      loading_results = true;
    });
    var url = 'https://full5end.pythonanywhere.com/search_filter?type='+filter+'&query='+pokemon;
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
  void initState() {
    // TODO: implement initState
    super.initState();
    searched = false;
    pokemon = '';
    filter = 'Name';
  }

  void search() {
    this.setState(() {
      loading_results = true;
    });
    var url = 'https://full5end.pythonanywhere.com/search?column='+filter+'&query='+pokemon;
    print(url);
    http.get(url, headers: {}).then((response) {
      setState(() {
        loading_results = false;
        Map<String, dynamic> parsed = json.decode(response.body);
        respVal = parsed['results'];        
      });
    });
    
  }

  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context).settings.arguments;

    try {
      if(args != null && !searched){
        this.setState(() {
          filter = args;
          searched = true;
        });
        searchFilter();
      }
    } catch (error) {
      print(error);
    }

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
                            if(filter != 'Name'){
                              searchFilter();
                            } else {
                              search();
                            }
                          },
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3,right: 10),
                      child: InkWell(
                        onTap: () {
                          showFilterDiag();
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
            ): Padding(
              padding: EdgeInsets.only(top: 100),
              child: Image.asset('assets/search.png')
            )
          ],
        )
      ),
    );
  }
}