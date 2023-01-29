import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tamuhack/screens/models/nearby_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class NearByPlacesScreen extends StatefulWidget {
  const NearByPlacesScreen({Key? key}) : super(key: key);

  @override
  State<NearByPlacesScreen> createState() => _NearByPlacesScreenState();
}

class _NearByPlacesScreenState extends State<NearByPlacesScreen> {

  List<Results> responses = [];

  static const apiKey = "AIzaSyDTluOtorcQ8tdQ7t3MV6YUtt7yKbuQKLw";
  static const radius = "30"; //radius of nearby places in meters ~ 20 miles
  static const latitude = 30.611560198615287;
  static const longitude = -96.341671918995;

  Future<List<Results>> getNearbyPlaces() async {
    var url = Uri.parse('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=$radius&key=$apiKey');
    var response = await http.post(url);
    return fromJson(jsonDecode(response.body));
  }

  List<Results> fromJson(Map<String, dynamic> json) {
    List<Results> results = [];
    json['results'].forEach((v) {
      results.add(Results.fromJson(v));
    });
    print(results);
    return results;
  }

  @override
  initState() {
    super.initState();

    getNearbyPlaces().then((result) => {
      setState(() {
        responses = result;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    late Widget list;
    if (responses.isNotEmpty) {
      List<String> pictureIDs = [];

      for (var response in responses) {
        pictureIDs.add(response.placeId ?? "");
      }




      list =
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: responses.map((response) => Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
                child: Column (
                  children: [
                    Text("Name: ${response.name!}"),
                    Text("Place ID: ${response.placeId!}"),
                  ])
                ),
              ).toList(),
    );
    }
    else {
      list = const Text("Loading");
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Hotspots'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          list
        ]
    )
    )
  );
  }

  Widget nearbyPlacesWidget(Results results){
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(10)),
        child: Column(
            children: [
              Text("Name: " + results.name!),
              Text("Place ID: " + results.placeId!),
    //           ElevatedButton(onPressed: ()
    // { Na
    //           }, child: child)
              //Image(image: results.placeId)
              //String placeId = results.placeId!;
            //renderPic(results);
            ]
        )
    );
  }

}
//
// class displayPic extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(‘Constructor — second page’),
//       ),
//       body: Container(
//           padding: EdgeInsets.all(12.0),
//           alignment: Alignment.center,
//           child: Column(
//               children: <Widget>[
//               Container(
//               height: 54.0,
//               padding: EdgeInsets.all(12.0),
//               child: Text(‘Data passed to this page:’,
//               style: TextStyle(fontWeight: FontWeight.w700))),
//       Text(‘Text: ${data.text}’),
//       Text(‘Counter: ${data.counter}’),
//       Text(‘Date: ${data.dateTime}’),
//       ],
//     ),
//     ),
//     );
//   }
// }
