library user.globals;

import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

bool isLoggedIn = false;
String first = "";
String last = "";
String email = "example";
String company = "JP";
List<String> interest = [];
List<String> friends = ["example1"];
List<DocumentReference> requestedRides = [];
late Uint8List defaultProfile;
