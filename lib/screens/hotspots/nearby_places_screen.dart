import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tamuhack/screens/models/nearby_response.dart';

class NearByPlacesScreen extends StatefulWidget {
  const NearByPlacesScreen({Key? key}) : super(key: key);

  @override
  State<NearByPlacesScreen> createState() => _NearByPlacesScreenState();
}

class _NearByPlacesScreenState extends State<NearByPlacesScreen> {
  String apiKey = "AIzaSyDTluOtorcQ8tdQ7t3MV6YUtt7yKbuQKLw";
  String radius = "30"; //radius of nearby places in meters ~ 20 miles

//dummy lat and long
  double latitude = 30.611560198615287;
  double longitude = -96.341671918995;

  NearbyPlacesResponse nearbyPlacesResponse = NearbyPlacesResponse();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Hotspots'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          ElevatedButton(onPressed: (){
            getNearbyPlaces();
          }, child: const Text("Find hotspots")),

        if (nearbyPlacesResponse.results!=null)
    for (int i = 0; i < nearbyPlacesResponse.results!.length; i++)
      nearbyPlacesWidget(nearbyPlacesResponse.results![i])

      //debugPrint((nearbyPlacesResponse.results.name));


        ]
    )
    )
    );
  }
  void getNearbyPlaces() async{
    var url = Uri.parse('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location='
        + latitude.toString() + ',' + longitude.toString() +'&radius=' + radius + '&key=' + apiKey);

    var response = await http.post(url);

    nearbyPlacesResponse = NearbyPlacesResponse.fromJson(jsonDecode(response.body));


    setState(() {
      //nearbyPlacesResponse = NearbyPlacesResponse.fromJson(jsonDecode(response.body));

    });
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
              Text("Place ID: " + results.placeId!)
              //String placeId = results.placeId!;
            //renderPic(results);
            ]
        )
    );
  }
}
