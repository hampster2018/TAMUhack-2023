import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String first = "";
  String last = "";
  String email = "example";
  String company = "JP";
  List interest = [];
  List friends = ["example1"];
  List<DocumentReference> requestedRides = [];

  User(this.first, this.last, this.email,
      [this.company = "None",
      this.interest = const [],
      this.friends = const []]);
}
