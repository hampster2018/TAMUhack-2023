import 'dart:convert';
import 'package:google_maps_webservice/places.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


Future<List<Image>> getReferences (List<String> placeIDs, String apiKey) async {
  List<PhotoReference> refs = [];
  for (var id in placeIDs) {
    var url = Uri.parse('https://maps.googleapis.com/maps/api/place/details/json?place_id=$id&key=$apiKey');
    var response = await http.post(url);
//get place metadata, including photo reference
    refs.add(fromJson(jsonDecode(response.body)));
  }
  List<Image> images = [];
    const baseUrl = "https://maps.googleapis.com/maps/api/place/photo";
    const maxWidth = "400";
    const maxHeight = "200";
    //final photoReference = "Aap_uEA7vb0DDYVJWEaX3O-AtYp77AaswQKSGtDaimt3gt7QCNpdjp1BkdM6acJ96xTec3tsV_ZJNL_JP-lqsVxydG3nh739RE_hepOOL05tfJh2_ranjMadb3VoBYFvF0ma6S24qZ6QJUuV6sSRrhCskSBP5C1myCzsebztMfGvm7ij3gZT";
    for (PhotoReference ref in refs) {
      final url = "$baseUrl?maxwidth=$maxWidth&maxheight=$maxHeight&photoreference=$ref&key=$apiKey";
      Image current = Image.network(url);
      images.add(current);
    }
    return images;
  }

  // List<Photo> photo = [];
  // for (PhotoReference ref in refs){
  //   //api call with ref.reference to get photo
  //   //add photo to "references: list
  //   var url = Uri.parse('https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=$ref&key=$apiKey');
  //   var response = await http.post(url);
  //   photo.add(fromJso(jsonDecode(response.body)));
  // }
  // //List<Image> notFutureImages;
  // Stream<Image> notFutureImages = (() async {
  //   for (int i = 0; i <= ; i++) {
  //   await FutureBuilder<Image>.delayed(Duration(seconds: 2));
  //     await Future<List<Image>>.delayed(Duration(seconds: 1));
  //     yield i;
  //   }
  // })();
  //return notFutureImages;
}
// List<Image> getImageList(Future<List<Image>> images){
//   List<Image> finalImages;
//   final baseUrl = "https://maps.googleapis.com/maps/api/place/photo";
//    final maxWidth = "400";
//   final maxHeight = "200";
//   for (Image img in images){
//
//     var url = "$baseUrl?maxwidth=$maxWidth&maxheight=$maxHeight&photoreference=$photoReference&key=$apiKey";
//     finalImages.add(img.url);
//   }
// }
Future<Image> getImage(placeId) async{
  final photoReference = await getReference(placeId);
  final baseUrl = "https://maps.googleapis.com/maps/api/place/photo";
  final maxWidth = "400";
  final maxHeight = "200";
  final url = "$baseUrl?maxwidth=$maxWidth&maxheight=$maxHeight&photoreference=$photoReference&key=$apiKey";
  return Image.network(url);
}

//list of reference numbers
PhotoReference fromJson(Map<String, dynamic> json) {
  print(json.toString());
  PhotoReference ref = PhotoReference();
  ref.reference = json['photo_reference'];
  print(ref);
  return ref;
}

Photo fromJso(Map<String, dynamic> json) {
  print(json.toString());
  Photo photo;
  photo = json['photos'];
  print(photo);
  return photo;
}

class PhotoReference {
  String reference = "";
}

Future<PhotoReference> getReference (String placeId, String apiKey) async{
  var url = Uri.parse('https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey');
  var response = await http.post(url);
  return fromJson(jsonDecode(response.body));
}