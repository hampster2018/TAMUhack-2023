import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../globals/user.dart' as user;

void makeRide(String pickUpLocation, String dropOffLocation, String day,
    int leavingTime, bool friendOnly, bool sameGenderOnly) async {
  CollectionReference needRides =
      FirebaseFirestore.instance.collection('needRides');

  DocumentReference requestedRideID = await needRides.add({
    'pickUpLocation': pickUpLocation,
    'dropOffLocation': dropOffLocation,
    'day': day,
    'leavingTime': leavingTime,
    'friendOnly': friendOnly,
    'sameGenderOnly': sameGenderOnly,
    'email': user.email
  });

  user.requestedRides.add(requestedRideID);

  //TODO - Update the user in the database
}
