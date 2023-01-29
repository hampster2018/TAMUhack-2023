import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tamuhack/screens/models/nearby_response.dart';
import 'dart:convert';
import 'package:google_maps_webservice/places.dart';

import 'get_references.dart';
//import 'package:flutter_google_places/flutter_google_places.dart';

class NearByPlacesScreen extends StatefulWidget {
  const NearByPlacesScreen({Key? key}) : super(key: key);

  @override
  State<NearByPlacesScreen> createState() => _NearByPlacesScreenState();
}

class _NearByPlacesScreenState extends State<NearByPlacesScreen> {

  List<Results> responses = [];
  List<Image> images = [];

  static const apiKey = "AIzaSyDTluOtorcQ8tdQ7t3MV6YUtt7yKbuQKLw";
  static const radius = "30000"; //radius of nearby places in meters ~ 20 miles
  static const latitude = 30.611560198615287;
  static const longitude = -96.341671918995;
  String type = "";
  //&type=$type

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

  List<String> getPictureIDs (List<Results> results) {
    List<String> ids = [];
    for (Results result in results) {
      ids.add(result.placeId ?? "");
    }
    return ids;
  }

  @override
  initState() {
    super.initState();

    getNearbyPlaces().then((result) => {
      responses = result,
      getReferences(getPictureIDs(responses), apiKey).then((result) =>
      {
        setState(() {
          images = result;
        })
      })
    });
  }
  getImage() async{
    final photoReference = await getReference(placeId);
    final baseUrl = "https://maps.googleapis.com/maps/api/place/photo";
    final maxWidth = "400";
    final maxHeight = "200";
    final url = "$baseUrl?maxwidth=$maxWidth&maxheight=$maxHeight&photoreference=$photoReference&key=$apiKey";
    return Image.network(url);
  }

  @override
  Widget build(BuildContext context) {
    late Widget list;
    if (responses.isNotEmpty) {
      List<String> pictureIDs = [];

      for (var response in responses) {
        pictureIDs.add(response.placeId ?? "");
      }

      //List<Image> photos = await getReferences(pictureIDs, apiKey);
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
                  children:[
                    getImage(images),
                    Text("Name: ${response.name!}"),
                    //Text("Place ID: ${response.placeId!}"),
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

  //display pictures using picIds list
  //create list of photo builders

  //for next loop take photo builders list and returns
  // Future<List<Results>> loadFutures(List<String> pictureIDs)  {
  //   List<String> fields;
  //   for (var id in pictureIDs) {
  //     //List<Place.Field.> fields = Collections.singletonList(Place.Field.PHOTO_METADATAS);
  //    //fields.add()
  //    final List<Place.Field> fields = Collections.singletonList(Place.Field.PHOTO_METADATAS);
  //   }
  //
  // }

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
