import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamuhack/screens/hotspots/nearby_places_screen.dart';

/*void main() {
  runApp(const MyApp());
}*/

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotspots',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GFG(),
    );
  }
}
class GFG extends StatefulWidget {
  const GFG({Key? key}) : super(key: key);

  @override
  State<GFG> createState() => _GFGState();
}

class _GFGState extends State<GFG> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hotspots Near You",
        ),
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate());
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: EdgeInsets.all(10)
                      ),

                    child: Column(
                      children: [
                        Container(
                         child: Text('Kyle Field'),
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: Text('0.5 mi away', style: TextStyle(fontSize: 10),),
                        ),
                        SizedBox(height: 10),
                        Container(
                            child: Image(image: AssetImage('images/kylefield.png'))
                        )
                      ]


            ),
                      onPressed: (
                          ) {
                        Navigator.of(context).pushReplacementNamed('/Home');
                        //Navigator.of(context).pushReplacementNamed('/Hotspots');
                      }),
                ),
                SizedBox(width: 20),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: EdgeInsets.all(10)
                      ),

                      child: Column(
                          children: [
                            Container(
                              child: Text('Bonfire Memorial'),
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: Text('1.2 mi away', style: TextStyle(fontSize: 10),),
                            ),
                            SizedBox(height: 10),
                            Container(
                                child: Image(image: AssetImage('images/bonfirememorial.jpg'))
                            )
                          ]


                      ),
                      onPressed: () {
                        //Navigator.of(context).pushReplacementNamed('/Hotspots');
                      }),
                ),
                CupertinoButton(
                  child: const Text("Nearby Places"),
                  onPressed: (){
                  // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  //   return const NearByPlacesScreen();
                  Navigator.of(context).pushReplacementNamed('/Home');
                  },
                ),
              ],
            ),
          ),
        ], //children of initial column
      ),

      //  ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  List<String> searchTerms = [
    "Restaurants",
    "Parks",
    "Things to Do",
    "Museums"
  ];

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}