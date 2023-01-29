//import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HotSpots extends StatelessWidget {
  const HotSpots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotspots',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GFG(),
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
        children: <Widget> [
          // Container(child: Row(
          //   children: CustomSearchDelegate(),
          //   onPressed: () {
          //     showSearch(
          //       context: context,
          //       delegate: CustomSearchDelegate()
          //     );
          //   },
          // )),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 140,
                  height: 140,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.all(10)
                      ),

                    child: Column(
                      children: [
                        Container(
                         child: const Text('Kyle Field'),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          child: const Text('0.3 mi away', style: TextStyle(fontSize: 10),),
                        ),
                        const SizedBox(height: 10),
                        const Image(image: AssetImage('images/kylefield.png'))
                      ]
            ),
                      onPressed: (
                          ) {
                       // Navigator.of(context).pushReplacementNamed('/Home');
                        //Navigator.of(context).pushReplacementNamed('/Hotspots');
                      }),
                ),
                const SizedBox(width: 50),
                SizedBox(
                  width: 140,
                  height: 140,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.all(10)
                      ),

                      child: Column(
                          children: const [
                            Text('Bonfire Memorial'),
                            //SizedBox(height: 5),
                            Text('0.8 mi away', style: TextStyle(fontSize: 10)),
                            SizedBox(height: 10),
                            Image(image: AssetImage('images/bonfirememorial.jpg'))
                          ]
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/Hotspots');
                      }),
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 140,
                  height: 140,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.all(10)
                      ),

                      child: Column(
                          children: [
                            Container(
                              child: const Text('Bush Library'),
                            ),
                            const SizedBox(height: 3),
                            Container(
                              child: const Text('1.9 mi away', style: TextStyle(fontSize: 10),),
                            ),
                            const SizedBox(height: 9),
                            const Image(image: AssetImage('images/gwbush.jpg'))

                      ]),
                      onPressed: (
                          ) {
                        // Navigator.of(context).pushReplacementNamed('/Home');
                        //Navigator.of(context).pushReplacementNamed('/Hotspots');
                      }),
                ),
                const SizedBox(width: 50),
                SizedBox(
                  width: 140,
                  height: 140,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.all(10)
                      ),

                      child: Column(
                          children: const [
                            Text('Library Gardens'),
                            //SizedBox(height: 5),
                            Text('2.1 mi away', style: TextStyle(fontSize: 10)),
                            SizedBox(height: 10),
                            Image(image: AssetImage('images/librarygardens.jpg'))
                          ]
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/Hotspots');
                      }),
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 140,
                  height: 140,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.all(10)
                      ),

                      child: Column(
                          children: [
                            Container(
                              child: const Text('Olsen Field'),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              child: const Text('1.1 mi away', style: TextStyle(fontSize: 10),),
                            ),
                            const SizedBox(height: 10),
                            const Image(image: AssetImage('images/olsen.jpg'))
                          ]
                      ),
                      onPressed: (
                          ) {
                        // Navigator.of(context).pushReplacementNamed('/Home');
                        //Navigator.of(context).pushReplacementNamed('/Hotspots');
                      }),
                ),
                const SizedBox(width: 50),
                SizedBox(
                  width: 140,
                  height: 140,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.all(10)
                      ),

                      child: Column(
                          children: const [
                            Text('Star Cinema'),
                            //SizedBox(height: 5),
                            Text('1.2 mi away', style: TextStyle(fontSize: 10)),
                            SizedBox(height: 10),
                            Image(image: AssetImage('images/starscinema.jpg'))
                          ]
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/Hotspots');
                      }),
                ),

              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       SizedBox(
          //         width: 140,
          //         height: 140,
          //         child: ElevatedButton(
          //             style: ElevatedButton.styleFrom(
          //                 backgroundColor: Colors.blueAccent,
          //                 padding: const EdgeInsets.all(10)
          //             ),
          //
          //             child: Column(
          //                 children: [
          //                   Container(
          //                     child: const Text('Kyle Field'),
          //                   ),
          //                   const SizedBox(height: 5),
          //                   Container(
          //                     child: const Text('0.5 mi away', style: TextStyle(fontSize: 10),),
          //                   ),
          //                   const SizedBox(height: 10),
          //                   const Image(image: AssetImage('images/kylefield.png'))
          //                 ]
          //             ),
          //             onPressed: (
          //                 ) {
          //               // Navigator.of(context).pushReplacementNamed('/Home');
          //               //Navigator.of(context).pushReplacementNamed('/Hotspots');
          //             }),
          //       ),
          //       const SizedBox(width: 50),
          //       SizedBox(
          //         width: 140,
          //         height: 140,
          //         child: ElevatedButton(
          //             style: ElevatedButton.styleFrom(
          //                 backgroundColor: Colors.blueAccent,
          //                 padding: const EdgeInsets.all(10)
          //             ),
          //
          //             child: Column(
          //                 children: const [
          //                   Text('Bonfire Memorial'),
          //                   //SizedBox(height: 5),
          //                   Text('1.2 mi away', style: TextStyle(fontSize: 10)),
          //                   SizedBox(height: 10),
          //                   Image(image: AssetImage('images/bonfirememorial.jpg'))
          //                 ]
          //             ),
          //             onPressed: () {
          //               Navigator.of(context).pushReplacementNamed('/Hotspots');
          //             }),
          //       ),
          //
          //     ],
          //   ),
          // ),
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
        icon: const Icon(Icons.clear),
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
      icon: const Icon(Icons.arrow_back),
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